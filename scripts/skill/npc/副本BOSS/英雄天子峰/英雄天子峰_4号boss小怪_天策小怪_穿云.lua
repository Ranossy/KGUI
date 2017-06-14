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
	{nDamageBase = 103 * 0.8, nDamageRand = 103 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 141 * 0.8, nDamageRand = 141 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 239 * 0.8, nDamageRand = 239 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 343 * 0.8, nDamageRand = 343 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 499 * 0.8, nDamageRand = 499 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 655 * 0.8, nDamageRand = 655 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 901 * 0.8, nDamageRand = 901 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1074 * 0.8, nDamageRand = 1074 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1247 * 0.8, nDamageRand = 1247 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1421 * 0.8, nDamageRand = 1421 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 1594 * 0.8, nDamageRand = 1594 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 1767 * 0.8, nDamageRand = 1767 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 1941 * 0.8, nDamageRand = 1941 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 2114 * 0.8, nDamageRand = 2114 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 2287 * 0.8, nDamageRand = 2287 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 2553 * 0.8, nDamageRand = 2553 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 2611 * 0.8, nDamageRand = 2611 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 2669 * 0.8, nDamageRand = 2669 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 2727 * 0.8, nDamageRand = 2727 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 2784 * 0.8, nDamageRand = 2784 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 2842 * 0.8, nDamageRand = 2842 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 2900 * 0.8, nDamageRand = 2900 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 2958 * 0.8, nDamageRand = 2958 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 3016 * 0.8, nDamageRand = 3016 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 3074 * 0.8, nDamageRand = 3074 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 3131 * 0.8, nDamageRand = 3131 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 3189 * 0.8, nDamageRand = 3189 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 3247 * 0.8, nDamageRand = 3247 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 3305 * 0.8, nDamageRand = 3305 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 3363 * 0.8, nDamageRand = 3363 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 3420 * 0.8, nDamageRand = 3420 * 0.4, nCostMana = 0},		--level 31
};

-- �����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
			tSkillData[dwSkillLevel].nDamageBase * 0.14, 
			0
			);

		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);
    
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
			0, 
			0
			);
		skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
			1486,
			1
		);		
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	skill.BindBuff(1, 1543, 1);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    --����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

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
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

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