---------------------------------------------------------------------->
-- 脚本名称:	scripts/skill/npc/副本BOSS/雁门关之役/雁门关小橙武陈颐安战斗buff.lua
-- 更新时间:	2014/11/11 15:29:07
-- 更新用户:	ks13376-PC
-- 脚本说明:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	local playertargetID = npc.GetCustomInteger4(4)
	local playertarget = GetPlayer(playertargetID)
	if not playertarget then
		npc.SetDisappearFrames(1, 0)
	end
	
	if npc.nCurrentLife <= npc.nMaxLife * 0.1 then
		npc.FireAIEvent(2003, 0, 0)
		return
	end
	
	if playertarget and playertarget.nMoveState == MOVE_STATE.ON_DEATH then
		npc.FireAIEvent(2004, 0, 0)
		return
	end
end

function UnApply(dwCharacterID)
end
 -- by 每天涨停@梦江南 $ Jx3UnPack-PAKV3 jx3.mail@gmail.com