---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/90����Ѩ/�����޹����˺�.lua
-- ����ʱ��:	2017/3/18 23:34:47
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_�׽�.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-02-24
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/include/skillcheck.lh")

tSkillData =
{

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = 3;

	----------------- ħ������ -------------------------------------------------
	--�Ȿ�ؼ����ò�����
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1469,
		1
	);]]--

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		4340,
		1
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- Ϊ�˵������apply�����ٰ�����ű�����һ�顣
		"skill/ؤ��/90����Ѩ/�����޹����˺�.lua",
		0
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);	-- ����Ŀ��Buff

	--skill.BindBuff(1, 1715, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
	--skill.nCostStamina	= 0;									-- �������ĵ�����
	--skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID

	----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С����
	skill.nMaxRadius = 4 * LENGTH_BASE;		-- ����ʩ�ŵ�������

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 50 * LENGTH_BASE;		-- �������ð뾶
	skill.nTargetCountLimit = 30;				-- ��������Ŀ����������,(С��0 ����Ŀ������������)

	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	return true;
end
-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(5638) ~= 0 and player.GetSkillLevel(8490) == 0 then
		local lv = player.GetSkillLevel(5638)
		player.ForgetSkill(5638)
		--player.LearnSkill(8490)
		player.LearnSkillLevel(8490, lv, dwCharacterID)
		RecipeCopy(5638, lv, player, 8490)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 5638, 8490, lv)
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetSkillLevel(8490) ~= 0 and player.GetSkillLevel(5638) == 0 then
		local lv = player.GetSkillLevel(8490)
		player.ForgetSkill(8490)
		--player.LearnSkill(5638)
		player.LearnSkillLevel(5638, lv, dwCharacterID)
		RecipeCopy(8490, lv, player, 5638)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 8490, 5638, lv)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com