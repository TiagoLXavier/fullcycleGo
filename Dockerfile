FROM golang:1.22 AS build
WORKDIR /app
COPY go.mod ./
COPY fullcycle.go ./
RUN go build -o /server

FROM scratch
WORKDIR /
COPY --from=build /server /server
ENTRYPOINT [ "/server" ]