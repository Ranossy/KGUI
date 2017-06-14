---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/װ��/�Ҽ����/ˮǹ��ħ�����Խű�.lua
-- ����ʱ��:	2015/7/2 22:14:50
-- �����û�:	zhangyan3
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID, dwSkillSrcID)--���ʱ����һ��
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	
	if player.dwBackItemIndex ~= 13905 and player.dwBackItemIndex ~= 13906 then -- ����ǲ���װ�˱����Ҽ��������� EQUIPMENT_REPRESENT.WAIST_EXTEND
		player.SetTimer(1 * 16 ,"scripts/skill/װ��/�Ҽ����/ˮǹ��ħ�����Խű�.lua", 0, 0)
		return
	end
	
	if player.dwBackItemIndex == 13905 then
		local buff = player.GetBuff(9163, 1)
		if not buff then
			player.AddBuff(0, 99, 9163, 1)
		end
		local buff1 = player.GetBuff(9165, 1)
		if not buff1 then
			player.AddBuff(0, 99, 9165, 1)
		end
	else
		player.DelBuff(9163, 1)
		player.DelBuff(9165, 1)
	end
	
	if player.dwBackItemIndex == 13906 then
		local buff = player.GetBuff(9164, 1)
		if not buff then
			player.AddBuff(0, 99, 9164, 1)
		end
		local buff1 = player.GetBuff(9166, 1)
		if not buff1 then
			player.AddBuff(0, 99, 9166, 1)
		end
	else
		player.DelBuff(9164, 1)
		player.DelBuff(9166, 1)
	end
	
	if player.GetDynamicSkillGroup() == 0 then
		player.SetDynamicSkillGroup(199)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)--
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	player.DelBuff(9163, 1)
	player.DelBuff(9165, 1)
	player.DelBuff(9164, 1)
	player.DelBuff(9166, 1)
	player.SetDynamicSkillGroup(0)
end

function OnTimer(player, nParam1, nParam2)
	player.DelBuff(9153, 1)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com