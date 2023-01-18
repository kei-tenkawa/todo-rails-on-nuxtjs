<template>
  <h1 class="mt-3 mb-3">ユーザ一覧</h1>

  <NuxtLink to="/admin/users/new">
    <div class="btn btn-primary my-3">
      新規登録
    </div>
  </NuxtLink>

  <div class="mb-3">
    <table class="table table-hover">
      <thead class="thead-default">
        <tr>
          <th>名前</th>
          <th>メールアドレス</th>
          <th>管理者権限</th>
          <th>登録日時</th>
          <th>更新日時</th>
          <th></th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>なまえ</td>
          <td>なまえ</td>
          <td>なまえ</td>
          <td>なまえ</td>
          <td>なまえ</td>
          <td>
            <div class="btn btn-primary me-3">編集</div>
            <div class="btn btn-danger">削除</div>
          </td>
        </tr>
      </tbody>
    </table>
  </div>
</template>
<script setup lang="ts">
definePageMeta({
  middleware: ['auth'],
})
</script>