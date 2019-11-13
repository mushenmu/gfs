class ApiController < ActionController::Base
    def down #请求下载数据
        gf = Gf.where(state:0).last rescue ''
        if gf && gf.update(state:1)
            render :json => {
                :headcode => 200,
                :message =>" ok",
                data: gf.url,
                },
                :status => 200
        else
            render :json => {
                :headcode => 404,
                :message =>"not find",
                data: "",
                },
                :status => 200
        end
    end

    def down_ok #请求下载数据完成
        gf = Gf.where(url: params["url"]).last rescue ''
        if gf && gf.update(state:2)
            render :json => {
                :headcode => 200,
                :message =>" ok",
                data: gf,
                },
                :status => 200
        else
            render :json => {
                :headcode => 404,
                :message =>"not find",
                data: "",
                },
                :status => 200
        end
    end

    def create_gfs
        gf = Gf.create(url: params["url"])
        if gf 
            render :json => {
                :headcode => 200,
                :message =>" ok",
                data: gf,
                },
                :status => 200
        else
            render :json => {
                :headcode => 404,
                :message =>"not find",
                data: "",
                },
                :status => 200
        end
    end
end
