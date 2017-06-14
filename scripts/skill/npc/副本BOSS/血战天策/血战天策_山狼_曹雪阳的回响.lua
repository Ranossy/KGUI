---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_ɽ��_��ѩ���Ļ���.lua
-- ����ʱ��:	2013/11/6 14:34:37
-- �����û�:	ks13376-PC
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end
	
	local scene = npc.GetScene()
	local playerlist = scene.GetAllPlayer()
	if #playerlist ~= 0 then
		for i = 1, #playerlist do
			local playertarget = GetPlayer(playerlist[i])
			if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
				if not playertarget.GetBuff(7150, 1) then
					playertarget.AddBuff(0, 99, 7150, 1)
				end
			end
		end
	end
	
	if npc.nCurrentLife <= npc.nMaxLife * 0.002 then
		if #playerlist ~= 0 then
			for i = 1, #playerlist do
				local playertarget = GetPlayer(playerlist[i])
				if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
					RemoteCallToClient(playertarget.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(6, 1173), 3)
					if playertarget.GetBuff(7150, 1) then
						playertarget.DelBuff(7150, 1)
					end
				end
			end
		end
		npc.SetDisappearFrames(1, 1)
	else
		npc.nCurrentLife = npc.nCurrentLife - npc.nMaxLife * 0.002
	end
	
	npc.PlaySfx(633, 0, 0, 0)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com