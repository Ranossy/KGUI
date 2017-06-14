------------------------------------------------
-- �ļ���    :  Ӣ�����ӷ�_1��boss_1��boss_�����ֻ�.lua
-- ������    :  �ⵣ
-- ����ʱ��  :  2009-10-22
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  ������Ԫ�˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 9720 * 0.8, nDamageRand = 9720 * 0.4, nCostMana = 0},		--level 1�ӵ�
	{nDamageBase = 13320 * 0.8, nDamageRand = 13320 * 0.4, nCostMana = 0},		--level 21�ӵ�
	{nDamageBase = 322241, nDamageRand = 166620, nCostMana = 0},		--level 3����
	{nDamageBase = 32375 * 0.8, nDamageRand = 32375 * 0.4, nCostMana = 0},		--level 4�ӵ�
	{nDamageBase = 47104 * 0.8, nDamageRand = 47104 * 0.4, nCostMana = 0},		--level 5�ӵ�
	{nDamageBase = 322241*2, nDamageRand = 166620*2, nCostMana = 0},		--level 6����
	{nDamageBase = 85070 * 0.8, nDamageRand = 85070 * 0.4, nCostMana = 0},		--level 71�ӵ�
	{nDamageBase = 101436 * 0.8, nDamageRand = 101436 * 0.4, nCostMana = 0},		--level 8�ӵ�
	{nDamageBase = 117801 * 0.8, nDamageRand = 117801 * 0.4, nCostMana = 0},		--level 9�ӵ�
	{nDamageBase = 134167 * 0.8, nDamageRand = 134167 * 0.4, nCostMana = 0},		--level 10�ӵ�
	{nDamageBase = 150533 * 0.8, nDamageRand = 150533 * 0.4, nCostMana = 0},		--level 11�ӵ�
	{nDamageBase = 166899 * 0.8, nDamageRand = 166899 * 0.4, nCostMana = 0},		--level 12�ӵ�
	{nDamageBase = 183265 * 0.8, nDamageRand = 183265 * 0.4, nCostMana = 0},		--level 13�ӵ�
	{nDamageBase = 199630 * 0.8, nDamageRand = 199630 * 0.4, nCostMana = 0},		--level 14�ӵ�
	{nDamageBase = 215996 * 0.8, nDamageRand = 215996 * 0.4, nCostMana = 0},		--level 15�ӵ�
	{nDamageBase = 241115 * 0.8, nDamageRand = 241115 * 0.4, nCostMana = 0},		--level 16�ӵ�
	{nDamageBase = 246575 * 0.8, nDamageRand = 246575 * 0.4, nCostMana = 0},		--level 17�ӵ�
	{nDamageBase = 252035 * 0.8, nDamageRand = 252035 * 0.4, nCostMana = 0},		--level 18�ӵ�
	{nDamageBase = 257495 * 0.8, nDamageRand = 257495 * 0.4, nCostMana = 0},		--level 19--���½Կӵ�
	{nDamageBase = 262955 * 0.8, nDamageRand = 262955 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 268414 * 0.8, nDamageRand = 268414 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 273874 * 0.8, nDamageRand = 273874 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 279334 * 0.8, nDamageRand = 279334 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 284794 * 0.8, nDamageRand = 284794 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 290254 * 0.8, nDamageRand = 290254 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 295714 * 0.8, nDamageRand = 295714 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 301173 * 0.8, nDamageRand = 301173 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 306633 * 0.8, nDamageRand = 306633 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 312093 * 0.8, nDamageRand = 312093 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 317553 * 0.8, nDamageRand = 317553 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 322241, nDamageRand = 166620, nCostMana = 0},		--level 31
};

-- �����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.ACTIVE_THREAT_COEFFICIENT,
			0, 
			-1024
			);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand, 
			0
			);
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
			0, 
			0
			);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckDestBuff(1606, 1, BUFF_COMPARE_FLAG.EQUAL, 1, BUFF_COMPARE_FLAG.EQUAL);
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, nBuffID, nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --����CD
    --skill.SetNormalCoolDown(1,16);							-- ����CD 1.5��
    --����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;
	skill.nThreatRevisePercent = 0

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;										-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana		-- �������ĵ�����
    --skill.nCostStamina	= 0;										-- �������ĵ�����
    --skill.nCostItemType	= 0;										-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;										-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 60 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 3 * GAME_FPS;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		  = 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
    --skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡
    
    ----------------- ����� -------------------------------------------------
    --skill.bIsFormationSkill	= false;			-- �Ƿ����ۼ���
    --skill.nFormationRange		= 0 * LENGTH_BASE;	-- ����ķ�Χ
    --skill.nLeastFormationPopulation	= 2;		-- ����ķ�Χ�����ٶ�Ա���������ӳ���
    
    ----------------- Ŀ��Ѫ������ ---------------------------------------------
    --skill.nTargetLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nTargetLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ����Ѫ������ ---------------------------------------------
    --skill.nSelfLifePercentMin	= 0;				-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;				-- Ѫ�����ֵ<=
    
    ----------------- ���˴��������� -------------------------------------------------
    --skill.nBeatBackRate       = 0;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 1 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	--skill.nDismountingRate	= 0;					-- ��Ŀ�����������,����1024��Ĭ��0
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



-- �Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
-- Player: ����ʩ����, nPreResult: �������水��һ�������жϵĽ��
-- ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    --�ж���ҵ�״̬�����ж��Ƿ���Է�������
	--player.CostItemInAllPackage(5, 5263, 1)
    return nPreResult;
end

-- ��������ʱ���ô˺���������skillΪ�������skill����һ�λ��ĳ������ʱҲ���ô˽ű�
function OnSkillLevelUp(skill, player)
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com