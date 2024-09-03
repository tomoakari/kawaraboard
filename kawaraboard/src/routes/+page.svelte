<script lang="ts">
    
    import PocketBase from 'pocketbase'
    const pb = new PocketBase('https://pocketbase-cloudrun-mfgb6pkdka-an.a.run.app');
    

    import Switch from '$lib/Switch.svelte'
    import { onMount } from 'svelte';

    let newpost = {
        title: "",
        tags: [""],
        urls: [{
            urlStr: "",
            linkTitle: ""
        }],
        summary: "",
        detail: "",
        user: "",
        createdAt: ""
    }
    let posts: Post[] = []

    let tegakimode = "off"
    let tegaki = false
    $: {
        tegaki = false
        if(tegakimode == "on"){
            tegaki = true
        }
    }

    let isShowNewpaper = false


    function addUrlList(){

    }
    function deleteUrlList(){

    }
    function addTagList(){
        
    }
    function deleteTagList(){
        
    }
    function sendPost(){
        if(newpost.title=="" || newpost.summary==""){
            alert("タイトルと概要は必須です")
            return
        }


    }

    function getRandomRotate() {
        return "rotate" + Math.floor(Math.random() * 3)
    }

    onMount(()=>{
        getPostData()
    })


    const MAX_GET_POSTS = 10
    let pageNum = 0
    async function getPostData(){
        pageNum += 1
        let resultData = await pb.collection('posts').getList(pageNum, MAX_GET_POSTS, {
            // filter: 'created >= "2022-01-01 00:00:00" && someField1 != someField2',
        });
        if(resultData.items.length == 0){
            alert("これより前の投稿はありません")
            pageNum -= 1
        }
        resultData.items.forEach((item)=>{
            
            let urls: Url[] = []
            item.urls.forEach((url: string)=>{
                let urljson = JSON.parse(JSON.stringify(url))
                let tempjson = {
                    urlStr: urljson.urlStr,
                    linkTitle: urljson.linkTitle
                }
                urls.push(tempjson)
            })
            
            let temp = {
                collectionId: item.collectionId,
                collectionName: item.collectionName,
                created: item.created,
                detail: item.detail,
                id: item.id,
                summary: item.summary,
                tags: item.tags.split(","),
                title: item.title,
                updated: item.updated,
                urls: urls,
                user: item.user,
                username: item.username,
                showflg: false
            }
            posts.push(temp);
        })

        posts = posts
    }


    interface Url {
        urlStr: string,
        linkTitle: string
    }
    interface Post {
        collectionId: string,
        collectionName: string,
        created: string,
        detail: string,
        id: string,
        summary: string,
        tags: string[],
        title: string,
        updated: string,
        urls: Url[],
        user: string,
        username: string,
        showflg: boolean
    }
    

</script>

<header>
    <img src="/icon.png" alt="icon">
    <div>KAWARA BOARD</div>
    <p>powerd by values dx</p>
    
    <button on:click={() => (window.location.href = '/auth')}>ログアウト</button>
    <div class="switch-container">
        <Switch bind:value={tegakimode} label="tegaki" design="slider" />
    </div>
</header>
<div class="main-container">
    <div class="board-area" class:tegaki>
        {#each posts as post}
        <div class="paper {getRandomRotate()}">
            <h2 class="post-title">{post.title}</h2>
            <div class="tag-area"><span>GCP</span><span>AI</span></div>
            <div class="summary-area">{post.summary}</div>
            <ul class="link-area">
                {#each post.urls as url}
                    <li><a href={url.urlStr} target="_blank">{url.linkTitle || url.urlStr}</a></li>
                {/each}
            </ul>
            {#if post.showflg}
            <div class="detail-area">{post.detail}</div>
            {:else if post.detail != ""}
            <button class="detail-link" on:click={()=>{post.showflg = true}}>≪ 詳細を開く ≫</button>
            {/if}
        </div>
        {/each}
    </div>
    <div class="more-button-area">
        <button on:click={()=>getPostData()}>もっと見る</button>
    </div>


    <div class="button-area">
        <button on:click|self={()=> {isShowNewpaper = true}}>
            投稿
        </button>
    </div>

    {#if isShowNewpaper}
    <!-- svelte-ignore a11y-click-events-have-key-events -->
    <!-- svelte-ignore a11y-no-static-element-interactions -->
    <div class="newpaper-BG" on:click|self={()=>{isShowNewpaper = false}} >
        <div class="newpaper">
            <div class="close-area" on:click={()=>{isShowNewpaper = false}} >
                <div>✕</div>
            </div>
            <h3>投稿</h3>
            <input type="text" bind:value={newpost.title} placeholder="タイトル" max="20">
            <textarea bind:value={newpost.summary} placeholder="概要" />
            <textarea bind:value={newpost.detail} placeholder="詳細" class="detail"/>
            <div class="list-area">
                <div class="list-input-area">
                    {#each newpost.urls as url}
                    <input type="text" bind:value={url.urlStr} placeholder="URL">
                    {/each}
                </div>
                <div class="plus-minus-area">
                    <button class="plus-button" on:click={()=>addUrlList()}>＋</button>
                    <button class="plus-button" on:click={()=>deleteUrlList()}>－</button>
                </div>
            </div>
            <div class="list-area">
                <div class="list-input-area">
                    {#each newpost.tags as tag}
                    <input type="text" bind:value={tag} placeholder="タグ">
                    {/each}
                </div>
                <div class="plus-minus-area">
                    <button class="plus-button" on:click={()=>addTagList()}>＋</button>
                    <button class="plus-button" on:click={()=>deleteTagList()}>－</button>
                </div>
            </div>
            
            <div class="post-button-area">
                <button class="post-button" on:click={()=>sendPost()}>投稿</button>
            </div>

        </div>
    </div>
    {/if}
</div>


<style>
    /* ヘッダー部 */
    header{
        position: fixed;
        top: 0px;
        left: 0px;
        z-index: 10000;
        background-color: white;
        width: 100%;
        display: flex;
        justify-content: start;
        box-shadow: 0px 0px 3px #808080;
    }
    header > img{
        height: 30px;
        margin: 5px 10px;
    }
    header > div{
        color: #3aa729;
        font-size: 30px;
        font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        font-weight: 600;
    }
    header > p{
        line-height: 10px;
        margin: 20px 0px 0px 10px;
        font-size: 10px;
        color: #808080;
    }
    .switch-container{
        margin-left: auto;
        padding-top: 16px;
        padding-right: 5px;
        color: #808080;
    }

    /* メインコンテナ */
    .main-container{
        background: #dddddd;
        width: 100%;
        height: 100vh;
        position: fixed;
        overflow-y: scroll;
        -ms-overflow-style: none;
        scrollbar-width: none;
    }
    .main-container::-webkit-scrollbar{
        display: none;
    }

    .board-area{
        padding-top: 50px;
        margin-left: auto;
        margin-right: auto;
        background-color: white;
        width: 1000px;
        /*
        display: flex;
        flex-wrap: wrap;
        align-items: flex-start;
        */
        display: grid;
        grid-template-columns: repeat(3, 305px);
        gap: 0px 30px;
    }

    /* 投稿 */
    .paper{
        width: 290px;
        margin: 10px;
        height: fit-content;
        /* background-color: antiquewhite;*/
        background-image: url('/bg_wp.jpg');
        background-size: cover;
        box-shadow: 0px 2px 11px -3px #808080;
        padding: 10px ;
    }
    .post-title{
        margin: 0px;
    }
    .rotate1{
        transform: rotate(-1deg);
    }
    .rotate2{
        transform: rotate(1deg);
    }
    .tag-area > span{
        font-size: 10px;
        border: 1px solid #57b748;
        border-radius: 3px;
        padding: 0px 5px;
        margin-right: 5px;
    }
    .summary-area{
        font-size: 14px;
        margin: 3px;
    }
    .link-area{
        list-style: none;
        padding: 0px;
        font-size: 12px;
    }
    .detail-area{
        border: 1px solid rgba(0, 0, 0, 0.2);
        font-size: 14px;
        padding: 5px;
    }
    .detail-link{
        border: none;
        background: none;
        text-decoration: dashed;
        font-size: 12px;
    }
    .detail-link:hover{
        color: #3aa729;
        cursor: pointer;
    }
    
    /* ボタン */
    .button-area{
        position: fixed;
        bottom: 0px;
        right: 0px;
        padding: 20px;
    }
    .button-area > button{
        background-color: #3aa729;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        font-size: 20px;
        color: white;
        cursor: pointer;
        box-shadow: 0px 0px 3px #808080;
    }
    .button-area > button:hover{
        background-color: #57b748;
    }
    .more-button-area{
        position: sticky;
        bottom: 0px;
        width: 100%;
        display: flex;
        justify-content: center;
    }
    .more-button-area > button{
        background-color: #64815f;
        padding: 10px 50px;
        margin: 10px;
        border: none;
        border-radius: 6px;
        font-size: 14px;
        color: white;
        cursor: pointer;
        box-shadow: 0px 0px 3px #808080;
    }
    .more-button-area > button:hover{
        opacity: 0.8;
    }
    
    /* 投稿モーダルウィンドウ */
    .newpaper-BG{
        position: fixed;
        top: 0px;
        left: 0px;
        z-index: 100000;
        height: 100vh;
        width: 100vw;
        background: rgba(0, 0, 0, 0.4);
        display: flex;
        justify-content: center;
    }
    .newpaper{
        margin-top: calc(50vh - 200px);
        height: fit-content;
        width: 400px;
        /*background-color: antiquewhite;*/
        background-image: url('/bg_wp.jpg');
        background-size: cover;
        padding: 10px;
    }
    .close-area{
        display: flex;
        justify-content: end;
    }
    .close-area > div{
        cursor: pointer;
        padding: 5px 8px;
        border-radius: 50px;
        font-size: 10px;
    }
    .close-area > div:hover{
        background: rgba(0, 0, 0, 0.2)
    }

    .newpaper h3{
        text-align: center;
        margin: 5px;
    }
    .newpaper input{
        width: calc(100% - 24px);
        padding: 8px 12px 5px 12px;
        border: none;
        border-radius: 8px;
        box-shadow: 0px 1px 5px -2px #808080 inset;
        margin-bottom: 5px;
    }
    .newpaper textarea{
        width: calc(100% - 24px);
        height: 60px;
        padding: 8px 12px 5px 12px;
        border: none;
        border-radius: 8px;
        box-shadow: 0px 1px 5px -2px #808080 inset;
    }
    textarea::-webkit-input-placeholder,
    textarea:-moz-placeholder{
        font-family: "Verdana",  sans-serif;
    }
    textarea.detail{
        height: 80px;
    }
    .list-area{
        display: flex;
        justify-content: start;
    }
    .list-input-area{
        width: 100%;
    }
    .list-input-area input{
        padding: 8px 12px 5px 12px;
        border: none;
        border-radius: 8px;
        box-shadow: 0px 1px 5px -2px #808080 inset;
        margin-bottom: 5px;
    }
    .plus-minus-area{
        width: 60px;
    }
    .plus-button{
        border: none;
        background: rgba(0, 0, 0, 0);
        cursor: pointer;
        padding: 3px 6px;
        border-radius: 30px;
        margin-right: -7px;
    }
    .plus-button:hover{
        background: rgba(0, 0, 0, 0.1);
    }
    .post-button-area{
        text-align: center;
        margin-top: 10px;
    }
    .post-button{
        background-color: #3aa729;
        padding: 10px 20px;
        border: none;
        border-radius: 10px;
        font-size: 20px;
        color: white;
        cursor: pointer;
        box-shadow: 0px 0px 3px #808080;
    }
    .post-button:hover{
        background-color: #57b748;
    }

</style>