<?php
/**
 * Simple HTTP Stream API Server in PHP.
 * =====================================
 * This script just counts up to 10 and meanwhile streams it
 * in JSON format as a chunk data.
 */

/* [Settings] ============================================================== */

const CRLF    = "\r\n";
const DIR_SEP = DIRECTORY_SEPARATOR;

header('Access-Control-Allow-Origin: *');
header('Content-type: application/octet-stream');
header('Transfer-encoding: chunked');
flush();

/* [Main] ================================================================== */

for ($i = 0; $i < 10; $i++) {
    $data_chunk = generate_chunk($i);
    output_chunk($data_chunk);
    flush();
    sleep(1);
}
echo "0" . CRLF . CRLF;

/* [Functions] ============================================================= */

function output_chunk($chunk)
{
    echo sprintf("%x" . CRLF, strlen($chunk));
    echo $chunk . CRLF;
}

function generate_chunk($count)
{
    // Actual data
    $data = [
        "response" => "foo",
        "count"    => $count
    ];

    // Dummy data to fill chunk.
    // Since the actual data is too small, it is hard
    // to notice if the client is recieving the chunks.
    // So we're filling them with dummy.
    $dummy = str_repeat(' ', 8000);

    return json_encode($data) . $dummy . PHP_EOL;
}
