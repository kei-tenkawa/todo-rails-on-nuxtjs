# TODO アプリ + Vue.js

## install
```
// at root
npx nuxi init frontend

docker compose build

// npm install at frontend container
docker compose run --rm frontend npm install

// コンテナ shell login
docker-compose exec 〇〇 /bin/sh

// コンテナ起動
docker compose up
```

```
docker compose run web rails ---

// ts install
docker compose run --rm frontend npm install --save-dev vue-tsc typescript
```
