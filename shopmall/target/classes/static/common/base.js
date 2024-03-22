function baseGet(url, data, success, async, deal) {
    baseAjax(url, "GET", data, success, async, deal);
}
var base_url = "http://localhost:8080";

function tim() {
    var customer_login_key_auth = localStorage.getItem("customer_login_key_auth");
    if(customer_login_key_auth ==null || customer_login_key_auth==""){
    }else{
        setTimeout( function(){
            layer.open({
                type: 2,
                title: "在线客服",
                offset: 'rb',
                area:['1020px','800px'],
                maxmin:true,
                offset: 'lb',
                shade:false,
                content: "./tim/index.html",
            });
        }, 2 * 1000 );
    }
}


function baseAjax(url, type, data, success, async, deal) {
    $.ajax({
        url: base_url+url,    //请求的url地址
        dataType: "json",   //返回格式为json
        async: async == undefined ? true : async,//请求是否异步，默认为异步，这也是ajax重要特性
        data: data,    //参数值
        type: type,   //请求方式
        success: function (req) {
            if (req.code == 200) {
                success(req.data, req.msg, req);
            } else if (req.code == 10001) {
                layer.confirm('您的登录凭证已经过期请重新登录？', {
                    btn: ['重新登录'] //按钮
                }, function () {
                    window.location.href = "/login";//跳转到登录界面
                });
            } else {//服务器错误
                layer.alert(req.msg, {
                    icon: 2,
                });
            }
        },
        error: function () {
            //请求出错处理
            layer.alert('服务器异常，请联系开发人员', {
                icon: 2,
            })
        }
    });
}
function getQueryVariable(variable)
{
  try {
      var query = window.location.search.substring(1);
      var vars = query.split("&");
      for (var i=0;i<vars.length;i++) {
          var pair = vars[i].split("=");
          if(pair[0] == variable){return pair[1];}
      }
      return(false);
  }catch (e) {
      return null;
  }
}

function basePost(req) {
    $.ajax({
        url:  base_url+req.url,    //请求的url地址
        dataType: req.dataType == undefined ? "json" : req.dataType,   //返回格式为json
        async: req.async == undefined ? true : req.async,//请求是否异步，默认为异步，这也是ajax重要特性
        data: req.data,   //参数值,键值对
        type: "POST",   //请求方式
        beforeSend: function (xhr) {
            xhr.setRequestHeader('user_login_key_auth', localStorage.getItem("user_login_key_auth"));
            xhr.setRequestHeader('customer_login_key_auth', localStorage.getItem("customer_login_key_auth"));
            if (req.beforeSend) {
                req.beforeSend();
            }
        },
        success: function (data) {
            if (data.code == 200) {
                req.success(data.data);
            } else if (data.code == 404) {
                window.top.location.href = "/admin/404.html";
            } else if (data.code == 10001) {
                window.top.location.href = "/admin/login.html";
            } else {
                if (req.error != undefined) {
                    req.error(data);
                } else {
                    layui.layer.alert(data.msg, {icon: 2, skin: 'layui-layer-molv'});
                }
            }
        },
        complete: function () {
            if (req.complete) {
                req.beforeSend();
            }
        },
        error: function () {
            if (req.error) {
                req.error();
            }
        }
    });
}

function getFormData(id) {
    var d = {};
    var t = $('#' + id).serializeArray();
    $.each(t, function () {
        d[this.name] = this.value;
    });
    return d;
}

/**
 * 地图
 * @param longitude
 * @param latitude
 * @param address
 */
function addressMap(longitude, latitude, address) {
    layer.open({
        type: 2,
        title: '高德地图-网页版',
        area: ['80%', '85%'],
        skin: 'layui-layer-molv',
        content: '/admin/map.html?address=' + address + "&longitude=" + longitude + "&latitude=" + latitude,
    });
}


// 函数参数必须是字符串，因为二代身份证号码是十八位，而在javascript中，十八位的数值会超出计算范围，造成不精确的结果，导致最后两位和计算的值不一致，从而该函数出现错误。
// 详情查看javascript的数值范围
function checkIDCard(idcode) {
    // 加权因子
    var weight_factor = [7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2];
    // 校验码
    var check_code = ['1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2'];

    var code = idcode + "";
    var last = idcode[17];//最后一个

    var seventeen = code.substring(0, 17);

    // ISO 7064:1983.MOD 11-2
    // 判断最后一位校验码是否正确
    var arr = seventeen.split("");
    var len = arr.length;
    var num = 0;
    for (var i = 0; i < len; i++) {
        num = num + arr[i] * weight_factor[i];
    }

    // 获取余数
    var resisue = num % 11;
    var last_no = check_code[resisue];

    // 格式的正则
    // 正则思路
    /*
    第一位不可能是0
    第二位到第六位可以是0-9
    第七位到第十位是年份，所以七八位为19或者20
    十一位和十二位是月份，这两位是01-12之间的数值
    十三位和十四位是日期，是从01-31之间的数值
    十五，十六，十七都是数字0-9
    十八位可能是数字0-9，也可能是X
    */
    var idcard_patter = /^[1-9][0-9]{5}([1][9][0-9]{2}|[2][0][0|1][0-9])([0][1-9]|[1][0|1|2])([0][1-9]|[1|2][0-9]|[3][0|1])[0-9]{3}([0-9]|[X|x])$/;

    // 判断格式是否正确
    var format = idcard_patter.test(idcode);

    // 返回验证结果，校验码和格式同时正确才算是合法的身份证号码
    return last === last_no && format ? true : false;
}

function selected() {
    var ses = $(".selectedlv")
    for (var i = 0; i < ses.length; i++) {
        var ss = ses.eq(i).attr("v");
        if (ss != null && ss != undefined && ss != "") {
            ses.eq(i).val(ss);
        } else {
            var options = ses.find("option");
            ses.eq(i).val(options.eq(0).attr("value"));
        }
    }
    try {
        layui.form.render();
    }catch (e) {
    }
}

$(function () {
    selected();//下拉框初始值
    buttonAuth();//按钮初始权限
});

var t2;

function uploadMoreImg(callBack, dimg, filedir, width, height) {
    if (filedir == undefined) {
        filedir = null;
    }
    width = width == undefined ? 0 : width;
    height = height == undefined ? 0 : height;
    t2 = window.setInterval("uploadMoreImgCallBack(" + callBack + ")", 100);
    sessionStorage.setItem("dimg", JSON.stringify(dimg));
    window.top.uploadMoreImgAlert = window.top.layer.open({
        type: 2,
        title: '批量上传图片',
        area: ['900px', '700px'],
        skin: 'layui-layer-molv',
        content: '/admin/uploadMoreImg.html?filedir=' + filedir + "&width=" + width + "&height=" + height
    });
}

function uploadMoreImgCallBack(callBack) {
    var str = sessionStorage.getItem("uploadMoreImgCallBack");
    if (str != null && str != "") {
        sessionStorage.removeItem("uploadMoreImgCallBack");
        try {
            window.clearInterval(t2);
        } catch (e) {
        }
        callBack(str);
    }
}

function closeuploadMoreImgAlert() {
    layer.close(window.top.uploadMoreImgAlert);
}


function buttonAuth() {
    try {
        var button = window.top.getButtons();
        var btns = $("[eh_auth]");
        if (btns.length > 0) {
            for (var i = 0; i < btns.length; i++) {
                var btn = btns.eq(i);
                var authIds = btn.attr("eh_auth");
                var flag = false;
                for (var j = 0; j < button.length; j++) {
                    if (button[j] == authIds) {
                        flag = true;
                        break;
                    }
                }
                if (!flag) {
                    btn.remove();
                }
            }
        }
    } catch (e) {

    }
}

$(function () {
    originalImg();
});

function originalImg() {
    $(".originalImg").off('click').on("click", function () {
        var img_url = $(this).attr("src");
        if (!img_url && img_url == null || img_url == undefined || img_url == "") {
            return false;
        }
        var img = new Image();
        img.src = img_url;
        var width = 0;
        var height = 0;
        if (img.complete) {
            width = img.width;
            height = img.height;
        } else {
            img.onload = function () {
                width = img.width;
                height = img.height;
            };
        }
        if (width > 1280) {
            height = height * (1280 / width);
            width = 1280;
        } else {
            var h = $(window.top).height() - 300;
            if (h <= height) {
                width = width * (h / height);
                height = h;
            }
        }
        window.top.layer.open({
            type: 1,
            title: false, //不显示标题
            area: [width + 'px', height + 'px'],
            content: '<img style="height: ' + height + 'px;" src="' + img_url + '"/>'
        });
    });
}

function getErrMsg(item, mr) {
    var errMsg = $(item).attr("placeholder");
    if (errMsg == null || errMsg == "") {
        errMsg = mr;
    }
    return errMsg;
}

var verifyJson = {
    required: function (value, item) {
        if (value == null || value == "" || value.match(/^[ ]*$/) == 0) {
            var errMsg = getErrMsg(item, "必填项目不能为空");
            return errMsg;
        }
    },
    requiredNull: function (value, item) {
        if (value == null  ) {
            var errMsg = getErrMsg(item, "必填项目不能为空");
            return errMsg;
        }
    }
    , idCard: function (value, item) {
        if (!checkIDCard(value)) {
            return '身份证号码格式有误！';
        }
    }
    , img: function (value, item) {
        value = $(item).attr("src");
        if (value == null || value == "" || value.match(/^[ ]*$/) == 0) {
            return getErrMsg(item, "图片不能为空")
        }
    }
    , pass: [/^([a-z]|[A-Z]|[0-9]){6,18}$/, '请输入6-18位密码']
    , phone: [/^1\d{10}$/, '手机号码有误']
    , number: function (value, item) {
        if (value == null || value == "" || value.match(/^[ ]*$/) == 0) {
            return getErrMsg(item, "必填项目不能为空")
        }
        var minNum = $(item).attr("minNum");
        if (minNum != undefined && minNum != null) {
            if (Number(value) < Number(minNum)) {
                return getErrMsg(item, "不能小于" + minNum)
            }
        }
        var maxNum = $(item).attr("maxNum");
        if (maxNum != undefined && maxNum != null) {
            if (Number(value) > Number(maxNum)) {
                return getErrMsg(item, "不能大于" + maxNum)
            }
        }
    }
    , title: function (value) {
        var reg = /^[a-zA-Z0-9_]+$/;
        if (value.length < 5) {
            return '请输入至少5位英文、数字，不能包含字符';
        } else if (!reg.test(value)) {
            return '请输入至少5位英文、数字，不能包含字符';
        }
    }
};

// 下载文件，请求方式：GET
function downFileGet(url) {
    window.top.open(url);
}


function imgCheck(img, width, height, callBack) {
    var imgFlag = true;
    var array = [];
    var screenImage = $(img);
    if (!screenImage) {
        callBack(array);
        return false;
    }
    if (screenImage.length > 1) {
        for (var i = 0; i < screenImage.length; i++) {
            var theImage = new Image();
            theImage.src = screenImage.eq(i).attr("src");
            var imageWidth = theImage.width;
            var imageHeight = theImage.height;
            array.push({
                imageWidth: imageWidth,
                imageHeight: imageHeight
            });
            if (imageWidth != width || imageHeight != height) {
                imgFlag = false;
            }
        }
    } else {
        var theImage = new Image();
        theImage.src = screenImage.attr("src");
        var imageWidth = theImage.width;
        var imageHeight = theImage.height;
        array.push({
            imageWidth: imageWidth,
            imageHeight: imageHeight
        });
        if (imageWidth != width || imageHeight != height) {
            imgFlag = false;
        }
    }
    callBack(array);
    return imgFlag;
}

/** 计算文件的MD5值  */
function getFileMd5(file, callBack) {
    // 创建文件读取对象，此对象允许Web应用程序异步读取存储在用户计算机上的文件内容
    var fileReader = new FileReader();
    // 根据浏览器获取文件分割方法
    var blobSlice = File.prototype.mozSlice || File.prototype.webkitSlice || File.prototype.slice;
    // 指定文件分块大小(2M)
    var chunkSize = 2 * 1024 * 1024;
    // 计算文件分块总数
    var chunks = Math.ceil(file.size / chunkSize);
    // 指定当前块指针
    var currentChunk = 0;
    // 创建MD5计算对象
    var spark = new SparkMD5.ArrayBuffer();
    loadNext();
    // 当读取操作成功完成时调用
    fileReader.onload = function () {
        // 将文件内容追加至spark中
        spark.append(this.result);
        currentChunk += 1;
        // 判断文件是否都已经读取完
        if (currentChunk < chunks) {
            loadNext();
        } else {
            var fileMd5 = spark.end();
            callBack(fileMd5);
        }
    };

    // FileReader分片式读取文件
    function loadNext() {
        // 计算开始读取的位置
        var start = currentChunk * chunkSize;
        // 计算结束读取的位置
        var end = start + chunkSize >= file.size ? file.size : start + chunkSize;
        fileReader.readAsArrayBuffer(blobSlice.call(file, start, end));
    }
}

/**
 * 单图片上传前校验
 * @param width  宽
 * @param height 高
 * @param obj layui 对象
 */
function imgCheckUpBefore(width, height, obj, btnId, done) {
    if (width && height) {
        //预读本地文件，如果是多文件，则会遍历。(不支持ie8/9)
        obj.preview(function (index, file, result) {
            var image = new Image();
            image.src = result;
            var w = image.width;
            var h = image.height;
            if (w == 0 || h == 0) {
                image.onload = function () {
                    w = image.width;
                    h = image.height;
                    if (width == w && height == h) {
                        getFileMd5(file, function (fileMd5) {
                            baseGet("/admin/upload/checkMd5.html", {md5: fileMd5}, function (data, msg, req) {
                                if (data == null || data == "") {
                                    $(btnId).click();
                                } else {
                                    console.log("MD5一样，直接获取原始文件地址" + req)
                                    done(req);
                                }
                            })
                        });
                    } else {
                        layer.alert('请上传指定尺寸的图片（' + width + 'px * ' + height + 'px）', {
                            icon: 2,
                            skin: 'layui-layer-molv'
                        });
                    }
                }
            } else {
                if (width == w && height == h) {
                    getFileMd5(file, function (fileMd5) {
                        baseGet("/admin/upload/checkMd5.html", {md5: fileMd5}, function (data, msg, req) {
                            if (data == null || data == "") {
                                $(btnId).click();
                            } else {
                                console.log("MD5一样，直接获取原始文件地址" + JSON.stringify(req))
                                done(req);
                            }
                        })
                    });
                } else {
                    layer.alert('请上传指定尺寸的图片（' + width + 'px * ' + height + 'px）', {icon: 2, skin: 'layui-layer-molv'});
                }
            }
        });
    } else {
        obj.preview(function (index, file, result) {
            getFileMd5(file, function (fileMd5) {
                baseGet("/admin/upload/checkMd5.html", {md5: fileMd5}, function (data, msg, req) {
                    if (data == null || data == "") {
                        $(btnId).click();
                    } else {
                        console.log("MD5一样，直接获取原始文件地址" + JSON.stringify(req))
                        done(req);
                    }
                })
            });
        });
    }
}

var upload_num = 0;

function uploadOneImg(elem, filedir, done, width, height) {
    var id = upload_num + "_" + "testListAction-singleImg";
    var s = $("#" + id);
    if (s.attr("id") == id) {
    } else {
        $("body").append('<a class="layui-btn" id="' + id + '" style="display: none;"></a>');
    }
    upload_num++;
    var loading;
    layui.upload.render({
        elem: elem //绑定元素
        , url: '/admin/upload/upload.html' //上传接口
        , accept: 'images'
        , acceptMime: 'image/*'
        , data: {filedir: filedir}
        , auto: false //选择文件后不自动上传
        , bindAction: '#' + id //指向一个按钮触发上传
        , before: function (obj) { //obj参数包含的信息，跟 choose回调完全一致，可参见上文。
            loading = layui.layer.load(1, {
                shade: [0.5, '#fff'] //0.1透明度的白色背景
            });
        }
        , choose: function (obj) {
            imgCheckUpBefore(width, height, obj, "#" + id, done);
        }
        , done: function (res) {
            layui.layer.close(loading);
            done(res);
        }
        , error: function (res) {
            layui.layer.close(loading);
            layer.alert('图片上传失败', {icon: 2, skin: 'layui-layer-molv'})
        }
    });
}

Date.prototype.format = function () {
    var s = '';
    var mouth = (this.getMonth() + 1) >= 10 ? (this.getMonth() + 1) : ('0' + (this.getMonth() + 1));
    var day = this.getDate() >= 10 ? this.getDate() : ('0' + this.getDate());
    s += this.getFullYear() + '-'; // 获取年份。
    s += mouth + "-"; // 获取月份。
    s += day; // 获取日。
    return (s); // 返回日期。
};

function getAllDate(begin, end) {
    var arr = [];
    var ab = begin.split("-");
    var ae = end.split("-");
    var db = new Date();
    db.setUTCFullYear(ab[0], ab[1] - 1, ab[2]);
    var de = new Date();
    de.setUTCFullYear(ae[0], ae[1] - 1, ae[2]);
    var unixDb = db.getTime() - 24 * 60 * 60 * 1000;
    var unixDe = de.getTime() - 24 * 60 * 60 * 1000;
    for (var k = unixDb; k <= unixDe;) {
        k = k + 24 * 60 * 60 * 1000;
        arr.push((new Date(parseInt(k))).format());
    }
    return arr;
}

// 设置界面各部分尺寸（背景板尺寸，数据条数等）
function viewSizeLinkage(){
    // 获取浏览器当前窗口可视区域高度
    var windowHeight = $(window).height();
    var demoTablesHeight = 0;
    // 获取搜索栏div高度
    var demoTables = $(".demoTable");
    for (var i = 0; i <demoTables.length ; i++) {
        demoTablesHeight += demoTables.eq(i).height();
    }
    // 设置页面背景板高度
    var height = windowHeight - 35;
    $(".layui-card").height(height);
    // 返回列表数据条数
    return parseInt((height - demoTablesHeight) / 43 - 2);
}

// 查看详情时设置页面只读
function readonly(operateType) {
    if (operateType == '1') {
        $("input").attr('readonly', true);
        $("textarea").attr('readonly', true);
        $(':radio').attr('disabled', true);
        $(':checkbox').attr('disabled', true);
        $(':button').attr('disabled', true);
        $('a').removeAttr('onclick');
        $('select').attr('disabled', true);
        $('.layui-input').attr('disabled', true);
    }
}