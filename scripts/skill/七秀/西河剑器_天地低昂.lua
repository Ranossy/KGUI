---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���ӽ���_��صͰ�.lua
-- ����ʱ��:	2013/8/19 15:22:03
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  �º���
-- ����ʱ��  :  2008-08-25
-- ����Ч��  :  �����˺�����30%������15��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nCostMana = 33 }, --level 1
	{ nCostMana = 57 }, --level 2
	{ nCostMana = 77 }, --level 3
	{ nCostMana = 98 }, --level 4
	{ nCostMana = 98 }, --level 5
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
    	
	----------------- ħ������ -------------------------------------------------
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/���ӽ���_��صͰ�.lua", --����ֵ1
		0															--����ֵ2
	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
	--skill.AddSlowCheckSelfBuff(409, 1, 2);		-- ��������Buff
	--skill.AddSlowCheckDestBuff(1727, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 684, 1);			-- ����Buff ����30%
	--skill.BindBuff(2, 775, 1);		-- ����Debuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);				-- ����Dot
	--skill.BindBuff(4, nBuffID, nBuffLevel);				-- ����Hot 

	----------------- ����Cool down --------------------------------------------
	--CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	skill.SetPublicCoolDown(16);				--����CD��1.5��
	skill.SetNormalCoolDown(1, 119);				--����CD��60��
	skill.SetCheckCoolDown(1, 444);

	----------------- ����������� ---------------------------------------------
	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
	--skill.dwLevelUpExp	= 0;    				-- ��������
	--skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;					-- ������������ֵ
	--skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;					-- �������ĵ�����
	--skill.nCostRage		= 0;					-- �������ĵ�ŭ��
	--skill.nCostStamina	= 0;					-- �������ĵ�����
	--skill.nCostItemType	= 0;					-- �������ĵ���Ʒ����
	--skill.nCostItemIndex	= 0;					-- �������ĵ���Ʒ����ID
	skill.nCostManaBasePercent = 286;	-- �������ĵ�����
	----------------- ������� -------------------------------------------------
	--   skill.bIsAccumulate	= true;				-- �����Ƿ���Ҫ����
	--   skill.SetSubsectionSkill(1, 1, 211, dwSkillLevel);
	--   skill.SetSubsectionSkill(2, 2, 212, dwSkillLevel);
	--   skill.SetSubsectionSkill(3, 10, 213, dwSkillLevel);
    
	----------------- ��״������� ---------------------------------------------
	--skill.nChainBranch	= 1;					--��״���ܷ�֧��
	--skill.nChainDepth		= 3;					--��״���ܲ���
	--��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
	----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius = 0;					-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 5 * LENGTH_BASE;					-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= tSkillData[dwSkillLevel].nLength * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
	----------------- ʱ����� -------------------------------------------------
	skill.nPrepareFrames = 0;				-- ����֡��
	--skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
	--skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
	skill.nBulletVelocity = 0;				-- �ӵ��ٶȣ���λ ��/֡
    
	----------------- ����� -------------------------------------------------
	--skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
	--skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
	--skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--nWeaponDamagePercent		= 1024;				-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	if player.IsSkillRecipeActive(187, 1) then
		player.AddBuff(player.dwID, player.nLevel, 684, 1, 13)		--��ؼ���
		player.AddBuff(player.dwID, player.nLevel, 775, 1, 8)		--������в
	else
		player.AddBuff(player.dwID, player.nLevel, 684, 1, 10)
		player.AddBuff(player.dwID, player.nLevel, 775, 1, 5)
	end
	
	--��ػ�Ѫ
	if player.GetSkillLevel(5861) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
		if player.IsSkillRecipeActive(187, 1) then
			player.AddBuff(player.dwID, player.nLevel, 11272, 1, 13)
		else
			player.AddBuff(player.dwID, player.nLevel, 11272, 1, 10)
		end
	end

	--[[
	--��ؼ���
	if player.GetSkillLevel(5862) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 5791, 1, 1)
	end
	--]]

	--��ز����Ľ���
	if player.GetSkillLevel(5863) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 1383, 2, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
		--player.DelBuff(5866, 1)
		player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
	end
	
	ModityCDToUI(player, 557, 0, 0)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com