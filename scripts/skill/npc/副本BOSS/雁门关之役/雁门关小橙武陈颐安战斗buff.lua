---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/���Ź�֮��/���Ź�С������ð�ս��buff.lua
-- ����ʱ��:	2014/11/11 15:29:07
-- �����û�:	ks13376-PC
-- �ű�˵��:
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com