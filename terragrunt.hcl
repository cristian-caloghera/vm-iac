errors {
    retry "retry_example" {
        retryable_errors = [".*Error: Invalid index.*"] # Matches errors
        max_attempts = 5                           # Retry up to 5 times
        sleep_interval_sec = 10                    # Wait 10 seconds between retries
    }
}
