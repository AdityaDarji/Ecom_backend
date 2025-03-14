<?php

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json");

include "dbUpload.php"; // Database connection

// Get the product_id from query parameters
$product_id = isset($_GET['product_id']) ? intval($_GET['product_id']) : 0;

$response = [];

if ($product_id > 0) {
    // Fetch product image
    $product_stmt = $conn->prepare("SELECT imgurl FROM products WHERE pid = ?");
    $product_stmt->bind_param("i", $product_id);
    $product_stmt->execute();
    $product_result = $product_stmt->get_result();
    $product_data = $product_result->fetch_assoc();
    $product_image = $product_data['imgurl'] ?? null;

    // Fetch reviews, user details, and comments
    $stmt = $conn->prepare("
        SELECT 
            r.id,
            r.user_email,
            r.rating,
            r.review,
            u.name AS user_name,
            u.image_url AS user_image
        FROM ratings_and_reviews r
        LEFT JOIN allusers u ON r.user_email = u.email
        WHERE r.product_id = ?
    ");
    $stmt->bind_param("i", $product_id);
    $stmt->execute();
    $result = $stmt->get_result();

    $reviews = [];
    $total_rating = 0;
    $total_reviews = $result->num_rows;

    while ($row = $result->fetch_assoc()) {
        $review_id = $row['id'];

        // Fetch comments for this review
        $comment_stmt = $conn->prepare("
            SELECT 
                c.id AS comment_id,
                c.review_id,
                c.user_id,
                c.parent_comment_id,
                c.comment_text
            FROM comments c
            WHERE c.review_id = ?
        ");
        $comment_stmt->bind_param("i", $review_id);
        $comment_stmt->execute();
        $comment_result = $comment_stmt->get_result();

        $comments = [];

        while ($comment_row = $comment_result->fetch_assoc()) {
            $comments[] = [
                "comment_id" => $comment_row['comment_id'],
                "review_id" => $comment_row['review_id'],
                "user_id" => $comment_row['user_id'],
                "parent_comment_id" => $comment_row['parent_comment_id'],
                "comment_text" => $comment_row['comment_text']
            ];
        }

        // Add review details to the list
        $reviews[] = [
            "user_name" => $row['user_name'],
            "user_image" => $row['user_image'],
            "rating" => $row['rating'],
            "review" => $row['review'],
            "comments" => $comments // Add comments for this review
        ];

        $total_rating += $row['rating'];
    }

    $average_rating = $total_reviews > 0 ? round($total_rating / $total_reviews, 2) : 0;

    // Response data
    $response = [
        "product_id" => $product_id,
        "product_image" => $product_image,
        "average_rating" => $average_rating,
        "total_reviews" => $total_reviews,
        "reviews" => $reviews
    ];
} else {
    $response = ["error" => "Invalid or missing product_id."];
}

$conn->close();

echo json_encode($response);
?>


