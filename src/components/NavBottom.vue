<template>
    <div class="nav-bottom-box">
        <div class="line"></div>
        <div class="jumbotronBox">
            <div class="container">
                <div class="jumbotron">
                    <h1>Thanks. For You</h1>

                    <div class="text">
                        <p>You're not invisible.</p>
                        <p>You're not alone.</p>
                        <p>You worth more than they know.</p>
                        <p>But you've been running running running.</p>
                        <p>when you should have known.</p>
                        <p>you're not forgettable.</p>
                    </div>
                    <div class="by">
                        By 
                        <a target="_blank" href="http://wpa.qq.com/msgrd?v=3&uin=2085203270&site=qq&menu=yes">时光机</a>
                    </div>
                </div>
            </div>
        </div>
        <div class="container">

        </div>
    </div>
</template>
<script>
export default {
    components: {
    }
}
</script>
<style lang="scss" scoped>
.nav-bottom-box {
    height: 50px;
    // .line {
    //     height: 1px;
    //     width: 100%;
    //     background-image:-webkit-linear-gradient(36deg,rgba(0, 0, 255, .2),rgba(0, 225, 255, 0.2),rgba(187, 255, 0, 0.2),rgba(255, 192, 203, 0.207),rgba(255, 0, 0, .2));
    // }
}
.jumbotronBox {
    position: relative;
    margin-top: 100px;
    height: 600px;
    background: linear-gradient(180deg, rgba(245,8,8,0.008) 0%, rgba(245,8,8,0.05) 20%,rgba(179, 15, 15, 0.24) 50%,rgba(119, 22, 22, 0.623) 100%);

}
.jumbotron {
    background: inherit;
    color: #fff;
    margin-top: 60px;
    .btn {
        background: linear-gradient(82deg, blue 0%,pink 0%,rgb(108, 131, 235) 100%);
        color: #fff;
        border: none;
    }
    h1 {
        text-align: center;
        background-image:-webkit-linear-gradient(90deg,rgba(45, 45, 221, 0.884),rgb(165, 74, 165),rgba(230, 48, 48, 0.911)); 
        -webkit-background-clip:text; 
        -webkit-text-fill-color:transparent;
        cursor: pointer; 
    }
}
pre {
    background: transparent;
    border: none;
}
.text {
    position: absolute;
    left: 50%;
    transform: translateX(-50%);
    text-transform: Capitalize;
}
.by {
    position: absolute;
    left: 50%;
    bottom: 15px;
    transform: translateX(-50%);
}
a {
    color: #fff;
    text-align: center;
    
    text-decoration: none;
}
</style>
