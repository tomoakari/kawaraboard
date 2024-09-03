<script lang="ts">
    import PocketBase from 'pocketbase';

    const pb = new PocketBase('https://pocketbase-cloudrun-mfgb6pkdka-an.a.run.app');

    async function login(form: HTMLFormElement) {
        try {
            await pb.collection('users').authWithOAuth2({ provider: 'google' });
            form.token.value = pb.authStore.token;
            form.submit();
        } catch (err) {
            console.error(err);
        }
    }
</script>

<form method="post" on:submit|preventDefault={(e) => login(e.currentTarget)}>
    <input name="token" type="hidden" />
    <button
        class="border rounded p-2 mt-10 bg-gray-800 text-white hover:bg-gray-700"
    >
        Login using Github
    </button>
</form>