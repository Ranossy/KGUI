---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/太原之战·逐虎驱狼/三骑将_镇山嚎_恐惧BUFF.lua
-- 更新时间:	2014/7/4 10:48:15
-- 更新用户:	wangwei-pc2
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
--[[
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local x = Random(256)
	player.TurnTo(x)
	
	local nDir = player.nFaceDirection * 2 * math.pi / 256
	local N_X = player.nX + 30 * 64 * math.cos(nDir)
	local N_Y = player.nY + 30 * 64 * math.sin(nDir)
	player.RunTo(N_X, N_Y)
	--]]
end

-- 当一个技能反应用的时候触发(如BUFF消失), 参数为作用的对象ID
function UnApply(dwCharacterID)

end
--[[
function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame)
	local boss = GetPlayer(nCharacterID)
	if not boss then
		return
	end	
	
	if nLeftFrame == 0 then
			
	end
end
--]]
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com