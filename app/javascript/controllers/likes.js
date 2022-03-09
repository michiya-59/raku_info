// 条件に応じて2つのボタン（Like, CancelLike）の表示を切り替える
const swiching = (isLiked, likeBtn, cancelLikeBtn) => {
  if (isLiked) {
    likeBtn.classList.add('h-hide')
    cancelLikeBtn.classList.remove('h-hide')
  } else {
    likeBtn.classList.remove('h-hide')
    cancelLikeBtn.classList.add('h-hide')
  }
}


window.addEventListener('load', () => {
  const likeContainers = document.querySelectorAll('[data-like-container]')
  
  Array.from(likeContainers).forEach(likeContainer => {
    const likeBtn = likeContainer.querySelector('[data-like]')
    const cancelLikeBtn = likeContainer.querySelector('[data-cancel-like]')
    // それぞれのボタンが2個あるので、Countを表示しているDOMも2個ある
    const countSpans = likeContainer.querySelectorAll('[data-count]')
    // HACK: 文字列でBooleanが入っているのでevalしてBooleanに変換する
    const isLiked = eval(likeContainer.dataset.isLiked);

    likeBtn.addEventListener('ajax:success', () => {
      Array.from(countSpans).forEach(countSpan => countSpan.innerHTML = eval(countSpan.innerHTML) + 1)
      swiching(true, likeBtn, cancelLikeBtn)
    })

    cancelLikeBtn.addEventListener('ajax:success', () => {
      Array.from(countSpans).forEach(countSpan => countSpan.innerHTML = eval(countSpan.innerHTML) - 1)
      swiching(false, likeBtn, cancelLikeBtn)
    })
    // Like済みかどうかを判定して、どちらを表示しておくかを処理する
    swiching(isLiked, likeBtn, cancelLikeBtn)
    console.log(likeContainer)
    console.log(likeBtn)
    console.log(cancelLikeBtn)
    console.log(countSpans)
    console.log(isLiked)
  })
});
