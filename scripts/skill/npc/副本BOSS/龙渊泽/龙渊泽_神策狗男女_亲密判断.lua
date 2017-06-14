---------------------------------------------------------------------->
-- 脚本名称:	scripts/Map/荻花宫后山/skill/最后的忍耐.lua
-- 更新时间:	12/01/10 16:41:58
-- 更新用户:	yule-PC
-- 脚本说明:	
----------------------------------------------------------------------<


-- 技能应用脚本, 当一个技能作用的时候触发, 参数为作用的对象ID
function Fx_GetOut(npcTarget, npc, nSpace)
	local x, y = npc.nX, npc.nY
	local TargetX, TargetY, TargetZ = npcTarget.nX, npcTarget.nY, npcTarget.nZ
	local Npc_2D_X = TargetX - x
	local Npc_2D_Y = TargetY - y
	local Npc_Space = math.sqrt(Npc_2D_X ^ 2 + Npc_2D_Y ^ 2)
	if Npc_Space >= nSpace then
		return true
	else
		return false
	end
end

function Apply(dwCharacterID) 
	--[[
	local npc = GetNpc(dwCharacterID)
	if npc then
		local scene = npc.GetScene()
		if not scene then
			return
		end
		
		local npcBossA = scene.GetNpcByNickName("Boss_1_Man")
		local npcBossB = scene.GetNpcByNickName("Boss_1_Woman")
		if npcBossA and npcBossB then
			if not Fx_GetOut(npcBossA, npcBossB, 10 * 64) then
				npcBossA.AddBuff(0, 99, 3089, 1)
				npcBossB.AddBuff(0, 99, 3089, 1)
			end
		end
	end
	--]]
end

-- 技能反应用脚本, 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)
end

 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com