---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/����/ս�˷����Ľ���50%.lua
-- ����ʱ��:	2013/9/25 10:19:19
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ����_����.lua
-- ������    :  CBG
-- ����ʱ��  :  2011-04-03
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")
Include("scripts/skill/include/skillcheck.lh")
tSkillData = 
{
	{nValue1 = -51, nValue2 = 1537}, --level 1
	{nValue1 = -102, nValue2 = 3072}, --level 2
	{nValue1 = -102, nValue2 = 3072}, --level 2
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = 3;
    	
	----------------- ħ������ -------------------------------------------------
	--[[
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		1227,
		1
	);	
	--]]
	--skill.AddAttribute(
	--ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
	--ATTRIBUTE_TYPE.CHANGE_SKILL_ICON,
	--427,
	--6520
	--);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- Ϊ�˵������apply�����ٰ�����ű�����һ�顣
		"skill/���/����/ս�˷����Ľ���50%.lua",
		0
		);
	--ս�˷��˺����10%
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SET_TALENT_RECIPE,
		2364,
		1
	);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff

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
	--[[
	local lv = player.GetSkillLevel(427)
	player.ForgetSkill(427)
	--player.LearnSkill(6520)
	player.LearnSkillLevel(6520, lv, dwCharacterID)
	RecipeCopy(427, lv, player, 6520)
	RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 6520, lv)
	--]]

	if player.GetSkillLevel(427) ~= 0 then
		local lv = player.GetSkillLevel(427)
		local nSkill = player.GetKungfuMount()
		if player.GetSkillLevel(9437) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10026 then
			--��ѩ���и�ħЧ��
			player.ForgetSkill(427)
			player.LearnSkillLevel(9441, lv, player.dwID)
			RecipeCopy(427, lv, player, 9441)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 9441, lv)
		else
			--���ǰ�ѩ����û���¸�ħ
			player.ForgetSkill(427)
			player.LearnSkillLevel(6520, lv, player.dwID)
			RecipeCopy(427, lv, player, 6520)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 427, 6520, lv)
		end
	elseif player.GetSkillLevel(9440) ~= 0 then
		local lv = player.GetSkillLevel(9440)
		if player.GetSkillLevel(9437) == 1 and nSkill ~= nil and nSkill.dwSkillID == 10026 then
			--��ѩ���и�ħЧ��
			player.ForgetSkill(9440)
			player.LearnSkillLevel(9441, lv, player.dwID)
			RecipeCopy(9440, lv, player, 9441)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9440, 9441, lv)
		else
			--���ǰ�ѩ����û���¸�ħ,��ʵ�������������
			player.ForgetSkill(9440)
			player.LearnSkillLevel(6520, lv, player.dwID)
			RecipeCopy(9440, lv, player, 6520)
			RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9440, 6520, lv)
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	--[[
	local lv = player.GetSkillLevel(6520)
	player.ForgetSkill(6520)
	--player.LearnSkill(427)
	player.LearnSkillLevel(427, lv, dwCharacterID)
	RecipeCopy(6520, lv, player, 427)
	RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 6520, 427, lv)
	--]]
	if player.GetSkillLevel(6520) ~= 0 then
		local lv = player.GetSkillLevel(6520)
		player.ForgetSkill(6520)
		player.LearnSkillLevel(427, lv, player.dwID)
		RecipeCopy(6520, lv, player, 427)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 6520, 427, lv)
	elseif player.GetSkillLevel(9441) ~= 0 then
		local lv = player.GetSkillLevel(9441)
		player.ForgetSkill(9441)
		player.LearnSkillLevel(9440, lv, player.dwID)
		RecipeCopy(9441, lv, player, 9440)
		RemoteCallToClient(player.dwID, "OnActionBarSkillReplace", 9441, 9440, lv)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com