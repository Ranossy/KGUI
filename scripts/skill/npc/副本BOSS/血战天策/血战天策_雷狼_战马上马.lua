---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/Ѫս���/Ѫս���_����_ս������.lua
-- ����ʱ��:	2013/10/28 14:59:55
-- �����û�:	liguanghao2
-- �ű�˵��:	
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local scene = player.GetScene()
		if not scene then
			return
		end
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 7)
		if scene.dwMapID == 175 then
			player.SetDynamicSkillGroup(77)
		elseif scene.dwMapID == 176 then
			player.SetDynamicSkillGroup(90)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 0)
		player.SetDynamicSkillGroup(0)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com