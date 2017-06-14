---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/荻花宫后山/skill/最后的忍耐.lua
-- 更新时间:	12/01/10 16:41:58
-- 更新用户:	yule-PC
-- 脚本说明:	
----------------------------------------------------------------------<


-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Apply(dwCharacterID) 
	local Buff_ID = 2319
	local Buff_LV = 1
	local cNpc = GetNpc(dwCharacterID)
	if cNpc then
		local scene = cNpc.GetScene()
		if not scene then
			return
		end
		local tPlayer = scene.GetAllPlayer()
		if tPlayer then
			for i = 1, #tPlayer do
				local thisPlayer = GetPlayer(tPlayer[i])
				if thisPlayer and thisPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
					thisPlayer.AddBuff(0, 99, Buff_ID, Buff_LV)
				end
			end
		end
	end
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com