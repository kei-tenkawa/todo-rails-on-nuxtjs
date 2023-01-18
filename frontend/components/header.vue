<template>
  <div class="app-title navbar navbar-expand-md navbar-light bg-light">
      <div class="navbar-brand ms-3"> Todo</div>

      <ul class="navbar-nav ms-auto">
        <li class="nav-item nav-link"><NuxtLink to="/tasks">タスク一覧</NuxtLink></li>
        <li class="nav-item nav-link"><NuxtLink to="/admin/users">ユーザ一覧</NuxtLink></li>
        <li class="nav-item nav-link"><NuxtLink to="/logout">ログアウト</NuxtLink></li>
      </ul>
  </div>
</template>