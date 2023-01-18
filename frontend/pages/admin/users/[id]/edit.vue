<template>
  <h1 class="mt-3 mb-3">ユーザの編集</h1>

  <div class="nav justify-content end">
    <NuxtLink to="/admin/users">
      <div class="nav-link">一覧</div>
    </NuxtLink>
  </div>
  <div>
    <div class="form-group">
      <label>名前</label>
      <input type="text" id="user_name" class="form-control" />
    </div>
    <div class="form-group">
      <label>メールアドレス</label>
      <input type="text" id="user_email" class="form-control" />
    </div>
    <div class="form-check">
      <label class="form-check-label"></label>
      <input type="checkbox" class="form-check-input" />管理者権限
    </div>
    <div class="form-group">
      <label>パスワード</label>
      <input type="password" id="user_password" class="form-control" />
    </div>
    <div class="form-group">
      <label>パスワード（確認）</label>
      <input type="password" id="user_password_confirm" class="form-control" />
    </div>
  </div>
  <div class="btn btn-primary mt-3">更新する</div>
</template>
<script setup lang="ts">
definePageMeta({
  middleware: ['auth'],
})
</script>