<template>
  <h1 class="mt-3 mt-3">タスク一覧</h1>

  <NuxtLink to="/tasks/new">
    <div class='btn btn-primary mb-3'>新規登録</div>
  </NuxtLink>


  <table clas="table table-hover">
    <thead class="thead-default">
      <tr>
        <th>名称</th>
        <th>種類</th>
        <th>進捗</th>
        <th>登録日時</th>
        <th></th>
      </tr>
    </thead>
    <tbody>
      <tr id="task-id">
        <td>タスク名</td>
        <td>タスク種類</td>
        <td>タスク進捗</td>
        <td>登録日時</td>
        <td>
          <div class='btn btn-primary me-3'>編集</div>
          <div class='btn btn-danger delete me-3'>削除</div>
        </td>
      </tr>
    </tbody>
  </table>
</template>