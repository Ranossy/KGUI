---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/����_������_�ͷ�.lua
-- ����ʱ��:	2016/5/12 11:15:06
-- �����û�:	XIAXIANBO
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")

function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	nJWLevel = player.GetSkillLevel(537) 		--����ȼ�
	local nMaxStackNum = nJWLevel + 3		--���������Ӳ���
	if player.GetSkillLevel(2710) == 1 then
		player.AddBuff(player.dwID, player.nLevel, 3892, nMaxStackNum, 1)
		for i = 1, nMaxStackNum do
			player.AddBuff(player.dwID, player.nLevel, 409, nJWLevel + 7)
			player.AddBuff(player.dwID, player.nLevel, 3892, 1, 1)
			--player.nAccumulateValue = player.nAccumulateValue + 1
		end
	elseif player.GetSkillLevel(2710) == 2 then
		player.AddBuff(player.dwID, player.nLevel, 3892, nMaxStackNum, 1)
		for i = 1, nMaxStackNum do
			player.AddBuff(player.dwID, player.nLevel, 409, nJWLevel + 14)
			--player.nAccumulateValue = player.nAccumulateValue + 1
		end
	else
		player.AddBuff(player.dwID, player.nLevel, 3892, nMaxStackNum, 1)
		for i = 1, nMaxStackNum do
			player.AddBuff(player.dwID, player.nLevel, 409, nJWLevel + 14)
			--player.nAccumulateValue = player.nAccumulateValue + 1
		end
	end
	player.AddBuff(player.dwID, player.nLevel, 2352, nJWLevel)

	if player.IsSkillRecipeActive(2418, 1) then
		for i = 1, 5 do
			player.AddBuff(player.dwID, player.nLevel, 10240, 1)
		end
	end
	--player.AddBuff(player.dwID, player.nLevel,2353,nJWLevel)

	ModityCDToUI(player, 573, 0, 0)
end

function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com