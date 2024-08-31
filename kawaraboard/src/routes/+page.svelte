<script>
    

    import Switch from '$lib/Switch.svelte'
	let sliderValue;
	let multiValue;


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
    let posts = [
        {
            id: 1,
            title: "１２３４５６７８９０１２",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 2,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスですIdentity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 3,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 4,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 5,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 6,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスですIdentity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 7,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
        {
            id: 8,
            title: "ちゅうもく！",
            tags: ["GCP", "AI"],
            urls: [{
                urlStr: "https://zenn.dev/google_cloud_jp/articles/cloudrun-iap",
                linkTitle: "Cloud Run と Identity-Aware Proxy で社内限定サービスを構築する"
            }],
            summary: "Identity-Aware Proxy (IAP) は Cloud Run などのアプリケーションへのアクセスを保護するためのサービスです",
            detail: "ユーザー ID を確認し、コンテキストに応じてアクセスの許可・拒否を判断させることができます",
            user: "松本",
            createdAt: "2018-06-26 10:16:41.704" ,
            showflg: false
        },
    ]

    let tegakimode = "on"
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
</script>

<header>
    <img src="/icon.png" alt="icon">
    <div>KAWARA BOARD</div>
    <p>powerd by values dx</p>
    
    <div class="switch-container">
        <Switch bind:value={tegakimode} label="tegaki" design="slider" />
    </div>
</header>
<div class="main-container">
    <div class="board-area" class:tegaki>
        {#each posts as post}
        <!-- svelte-ignore a11y-no-static-element-interactions -->
        <!-- svelte-ignore a11y-mouse-events-have-key-events -->
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
            {:else}
            <button class="detail-link" on:click={()=>{post.showflg = true}}>≪ 詳細を開く ≫</button>
            {/if}
        </div>
        {/each}
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