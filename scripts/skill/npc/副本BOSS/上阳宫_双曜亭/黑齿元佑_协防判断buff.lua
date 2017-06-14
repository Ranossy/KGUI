---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/上阳宫_双曜亭/黑齿元佑_协防判断buff.lua
-- 更新时间:	2016/3/30 15:34:23
-- 更新用户:	zhangdongen
-- 脚本说明:
----------------------------------------------------------------------<

--------------脚本文件开始------------------------------------------------
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	local boss = scene.GetNpcByNickName("heichiyuanyouboss")
	local heichishuazhizhukongzhi = scene.GetNpcByNickName("heichishuazhizhukongzhi")
	if scene.dwMapID == 241 or scene.dwMapID == 251 then
		if boss then
			if npc.dwID ~= boss.dwID then
				local k = 0
				if heichishuazhizhukongzhi then
					local index = heichishuazhizhukongzhi.GetCustomInteger4(1)
					for i = 1, index do
						local zhizhu = scene.GetNpcByNickName("heichizhizhu" .. i)
						if zhizhu then
							if npc.dwID ~= zhizhu.dwID then
								if GetCharacterDistance(npc.dwID, zhizhu.dwID) <= 640 then
									k = k + 1
								end
							end
						end
					end
				end
		
				if GetCharacterDistance(npc.dwID, boss.dwID) <= 640 then
					k = k + 1
				end
		
				if k == 0 then
					if npc.GetBuff(10583, 1) then
						npc.DelBuff(10583, 1)
					end
				end
			end

			if npc.dwID == boss.dwID then
				local k = 0
				if heichishuazhizhukongzhi then
					local index = heichishuazhizhukongzhi.GetCustomInteger4(1)
					for i = 1, index do
						local zhizhu = scene.GetNpcByNickName("heichizhizhu" .. i)
						if zhizhu then
							if GetCharacterDistance(npc.dwID, zhizhu.dwID) <= 640 then
								k = k + 1
							end
						end
					end
				end

				if k == 0 then
					if npc.GetBuff(10583, 1) then
						npc.DelBuff(10583, 1)
					end
				end
			end
		end
		npc.CastSkill(15704, 1)
	end

	if scene.dwMapID == 249 then
		if boss then
			if npc.dwID ~= boss.dwID then
				local k = 0
				if heichishuazhizhukongzhi then
					local index = heichishuazhizhukongzhi.GetCustomInteger4(1)
					for i = 1, index do
						local zhizhu = scene.GetNpcByNickName("heichizhizhu" .. i)
						if zhizhu then
							if npc.dwID ~= zhizhu.dwID then
								if GetCharacterDistance(npc.dwID, zhizhu.dwID) <= 640 then
									k = k + 1
								end
							end
						end
					end
				end
		
				if GetCharacterDistance(npc.dwID, boss.dwID) <= 640 then
					k = k + 1
				end
		
				if k == 0 then
					if npc.GetBuff(10583, 2) then
						npc.DelBuff(10583, 2)
					end
				end
			end

			if npc.dwID == boss.dwID then
				local k = 0
				if heichishuazhizhukongzhi then
					local index = heichishuazhizhukongzhi.GetCustomInteger4(1)
					for i = 1, index do
						local zhizhu = scene.GetNpcByNickName("heichizhizhu" .. i)
						if zhizhu then
							if GetCharacterDistance(npc.dwID, zhizhu.dwID) <= 640 then
								k = k + 1
							end
						end
					end
				end

				if k == 0 then
					if npc.GetBuff(10583, 2) then
						npc.DelBuff(10583, 2)
					end
				end
			end
		end
		npc.CastSkill(15704, 2)
	end
end

--魔法属性反应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com