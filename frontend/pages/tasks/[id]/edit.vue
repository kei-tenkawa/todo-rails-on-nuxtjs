<template>
  <h1 class="mt-3">タスクの編集</h1>

  <div class="nav justify-content end">
    <div class="nav-link">一覧</div>
  </div>
    <div>
      <div class="form-group">
        <label>タスク名称</label>
        <input type="text" id="task_name" class="form-control" />
      </div>
      <!-- <div class="form-group">
        <label>種類</label>
        <input type="text" id="task_name" class="form-control" />
      </div> -->
      <div class="form-group">
        <label>詳しい説明</label>
        <textarea rows="5" id='task_description' class="form-control"></textarea>
      </div>
      <!-- <div class="form-group">
        <label>進捗</label>
        <textarea rows="5" id='task_description' class="form-control"></textarea>
      </div>
      <div class="form-group">
        <label>画像</label>
        <textarea rows="5" id='task_description' class="form-control"></textarea>
      </div> -->
    </div>
    <div class="btn btn-primary mt-3">更新する</div>
</template>