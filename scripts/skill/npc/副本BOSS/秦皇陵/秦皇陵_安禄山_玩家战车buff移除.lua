---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�ػ���/�ػ���_��»ɽ_���ս��buff�Ƴ�.lua
-- ����ʱ��:	2014/3/7 9:46:39
-- �����û�:	ks13376-PC
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	
end

function UnApply(dwCharacterID)
end

function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
	local playertarget = GetPlayer(nCharacterID)
	if playertarget then
		local scene = playertarget.GetScene()
		if scene.dwMapID == 182 then
			playertarget.DownHorse()
			playertarget.SetDynamicSkillGroup(0)
			playertarget.DelBuff(7591, 1)
			playertarget.DelGroupBuff(7677, 1)
			playertarget.AddBuff(0, 99, 2587, 3)
			playertarget.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, nCustomValue)
		end

		if scene.dwMapID == 183 then
			playertarget.DownHorse()
			playertarget.SetDynamicSkillGroup(0)
			playertarget.DelBuff(7591, 1)
			playertarget.DelGroupBuff(7677, 2)
			playertarget.AddBuff(0, 99, 2587, 3)
			playertarget.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, nCustomValue)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com