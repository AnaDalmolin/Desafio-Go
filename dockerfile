FROM golang:alpine AS builder

WORKDIR /app

ENV GO111MODULE=off

COPY fullcycle.go .

RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o fullcycle .

FROM scratch

COPY --from=builder /app/fullcycle .

CMD ["./fullcycle"]