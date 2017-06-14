---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/Default.lua
-- 更新时间:	2015/7/29 14:31:27
-- 更新用户:	mengxiangfei11
-- 脚本说明:
----------------------------------------------------------------------<


--魔法属性应用时的执行函数,dwCharacterID是魔法属性作用的目标ID
function Apply(dwCharacterID)
	local thisBoss = GetNpc(dwCharacterID)
	

	if thisBoss and thisBoss.nMoveState ~= MOVE_STATE.ON_DEATH then
		if thisBoss.szName == "LiLin" then
			local scene = thisBoss.GetScene()
			if not scene then
				return
			end
			local otherBoss = scene.GetNpcByNickName("ShiSan")
			if otherBoss then
				otherBoss.AddBuff(0, 99, 10111, 1)			
			end
			
		elseif thisBoss.szName == "ShiSan" then
			local scene = thisBoss.GetScene()
			if not scene then
				return
			end
			local otherBoss = scene.GetNpcByNickName("LiLin")
			if otherBoss then
				otherBoss.AddBuff(0, 99, 10111, 1)
			end
		end
	end
	
	
end


 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com