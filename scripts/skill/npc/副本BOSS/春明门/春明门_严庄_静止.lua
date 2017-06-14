---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������/������_��ׯ_��ֹ.lua
-- ����ʱ��:	2014/5/16 14:48:53
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	local scene = player.GetScene()
	local langyapanwenjunguan = scene.GetNpcByNickName("langyapanwenjunguan")
	local langyajieyinren = scene.GetNpcByNickName("langyajieyinren")
	if player.nMoveState ~= MOVE_STATE.ON_STAND then
		player.AddBuff(0, 99, 7853, 1, 30)
	end

	if player.GetBuff(7853, 1) then
		if player.GetBuff(7853, 1).nStackNum >= 5 then
			if langyapanwenjunguan then
				langyapanwenjunguan.Say(GetEditorString(6, 5350))
			end

			if langyajieyinren then
				langyajieyinren.FireAIEvent(2001, 0, 0)
			end
			
			local playerlist = scene.GetAllPlayer()
			for i = 1, #playerlist do
				local playertarget = GetPlayer(playerlist[i])
				if playertarget then
					playertarget.DelBuff(7849, 1)
					playertarget.DelGroupBuff(7853, 1)
					if langyapanwenjunguan then
						langyapanwenjunguan.ModifyThreat(playertarget.dwID, 0)
					end
				end
			end
		end
	end
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com