class ApiController < ActionController::API
    def down #请求下载数据
        gf = Gf.where(state:0).first rescue ''
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
        if params["url"] 
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
            
        elsif params["data"]
            data = []
            params["data"].split('|').each do |url|
                if url != ''
                data << Gf.new(
                    url: url
                )
                end
            end
            Gf.import data
        else

        end
    end

    def incomplete_gfs #请求下载数据未完成
        gf = Gf.where(url: params["url"]).last rescue ''
        if gf && gf.update(state:0)
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

    def down_gas #请求下载数据
        year = params['year']
        gf = Ga.where("url like ?", "%/#{year}/%").where(state:0).first rescue ''
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

    def down_gas_ok #请求下载数据完成
        ga = Ga.where(url: params["url"]).last rescue ''
        if ga && ga.update(state:2)
            render :json => {
                :headcode => 200,
                :message =>" ok",
                data: ga,
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

    def create_gas
        if params["url"] 
            ga = Ga.create(url: params["url"])
            if ga 
                render :json => {
                    :headcode => 200,
                    :message =>" ok",
                    data: ga,
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
            
        elsif params["data"]
            data = []
            params["data"].split('|').each do |url|
                if url != ''
                data << Ga.new(
                    url: url
                )
                end
            end
            Ga.import data
        else

        end
    end

    def incomplete_gas #请求下载数据未完成
        ga = Ga.where(url: params["url"]).last rescue ''
        if ga && ga.update(state:0)
            render :json => {
                :headcode => 200,
                :message =>" ok",
                data: ga,
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
