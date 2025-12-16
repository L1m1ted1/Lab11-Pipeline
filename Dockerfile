# Використовуємо базовий образ Alpine (для мінімального розміру)
FROM alpine:latest
# Запуск команди при старті контейнера
CMD ["echo", "Container image built by Jenkins!"]
