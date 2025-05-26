import redis
import json
import time

# Connect to Redis
r = redis.Redis(host='redis', port=6379)

# Define a job
job = {
    "id": 1,
    "type": "email",
    "payload": "Send welcome email"
}

# Serialize to JSON
job_json = json.dumps(job)

# Push to 'jobs' queue
r.rpush('jobs', job_json)
print("✅ Job pushed to Redis")

# Wait for 2 seconds
time.sleep(2)

# Pop the job from the queue
popped_job = r.lpop('jobs')

if popped_job:
    job_data = json.loads(popped_job)
    print("📤 Job popped from Redis:", job_data)
else:
    print("⚠️ No job found in Redis")
