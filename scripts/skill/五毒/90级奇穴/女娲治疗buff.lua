---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�嶾/90����Ѩ/Ů�����buff.lua
-- ����ʱ��:	2016/5/12 11:15:44
-- �����û�:	XIAXIANBO
-- �ű�˵��:
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")


function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(6882) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5778, 2)
	end

	local nbuffcount = 20

	if player.IsSkillRecipeActive(801, 1) then
		nbuffcount = nbuffcount + 3
	end

	if player.GetSkillLevel(6670) == 1 then
		nbuffcount = nbuffcount - 13
	end

	player.AddBuff(player.dwID, player.nLevel, 2315, 1, nbuffcount)

	ModityCDToUI(player, 2230, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com