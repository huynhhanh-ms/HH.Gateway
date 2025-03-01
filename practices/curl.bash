
curl -X POST http://localhost:9999/login `
  -H "Content-Type: application/json" `
  -d '{"username":"bich", "password":"123123"}'

curl -X POST http://localhost:8000/users `
  -H "Content-Type: application/json" `
  -H "Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3NzIzOTIyMTEsImlzcyI6ImhoLWNvbXBhbnkiLCJ1c2VybmFtZSI6ImJpY2gifQ.Kk9rtR17vHSnBclQjYYhqukuWimr-7VhLSsw_5gJppQ"
