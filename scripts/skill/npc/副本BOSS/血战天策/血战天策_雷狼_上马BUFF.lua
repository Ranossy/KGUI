------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-9-10
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		player.DelBuff(244, 1)
		player.SetDynamicSkillGroup(81)
		player.AddBuff(0,99,5194,1,1)
		player.AddBuff(0,99,5214,1,1)
		player.AddBuff(0,99,5215,1,1)
		player.AddBuff(0,99,5216,1,1)
		player.AddBuff(0, 99, 5217, 1, 1)
		local t = player.GetRepresentID()
		local buff = player.GetBuff(5194, 1)
		local buff1 = player.GetBuff(5214, 1)
		local buff2 = player.GetBuff(5215, 1)
		local buff3 = player.GetBuff(5216, 1)
		local buff4 = player.GetBuff(5217, 1)
		buff.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_STYLE]
		--print(buff.nCustomValue)
		buff1.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT1]
		--print(buff1.nCustomValue)
		buff2.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT2]
		--print(buff2.nCustomValue)
		buff3.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT3]
		--print(buff3.nCustomValue)
		buff4.nCustomValue = t[EQUIPMENT_REPRESENT.HORSE_ADORNMENT4]
		--print(buff4.nCustomValue)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, 8)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT1, 0)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT2, 0)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT3, 0)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT4, 0)
		player.AddBuff(0, 99, 244, 1)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player then
		local buff = player.GetBuff(5194, 1)
		local buff1 = player.GetBuff(5214,1)
		local buff2 = player.GetBuff(5215,1)
		local buff3 = player.GetBuff(5216,1)
		local buff4 = player.GetBuff(5217, 1)
		local t = buff.nCustomValue
		local t1 = buff1.nCustomValue
		local t2 = buff2.nCustomValue
		local t3 = buff3.nCustomValue
		local t4 = buff4.nCustomValue
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_STYLE, t)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT1, t1)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT2, t2)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT3, t3)
		player.SetRepresentID(EQUIPMENT_REPRESENT.HORSE_ADORNMENT4, t4)
		player.DelBuff(5194, 1)
		player.DelBuff(5214, 1)
		player.DelBuff(5215, 1)
		player.DelBuff(5216, 1)
		player.DelBuff(5217, 1)
		player.SetDynamicSkillGroup(0)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com