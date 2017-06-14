------------------------------------------------
-- 创建人   :  张豪	
-- 创建时间	:  2013-9-10
-- 效果备注	:  默认的技能脚本
------------------------------------------------

--------------脚本文件开始------------------------------------------------

--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local scene = player.GetScene()
	local dongnanshuaguaikongzhi = scene.GetNpcByNickName("dongnanshuaiguaikongzhi")
	player.DelBuff(6676, 1)
	
	if dongnanshuaguaikongzhi then
		local nindex = dongnanshuaguaikongzhi.GetCustomInteger4(4)
		for i = 1, nindex + 1 do
			local xiaoguai = scene.GetNpcByNickName("dongnanlangyabing" .. i)
			if xiaoguai then
				if xiaoguai.GetCustomInteger4(20) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(20, 0)
				end
				
				if xiaoguai.GetCustomInteger4(24) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(24, 0)
				end
				
				if xiaoguai.GetCustomInteger4(28) == player.dwID then
					xiaoguai.DelBuff(6675, 1)
					xiaoguai.SetCustomInteger4(28, 0)
				end
			end
		end
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com