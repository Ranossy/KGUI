------------------------------------------------
-- ������   :  CBG
-- ����ʱ��	:  2011-08-12
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 28 * 0.95, nDamageRand = 28 * 0.1, nCostMana = 147},		--level 1
	{nDamageBase = 42 * 0.95, nDamageRand = 42 * 0.1, nCostMana = 220},		--level 2
	{nDamageBase = 56 * 0.95, nDamageRand = 56 * 0.1, nCostMana = 327},		--level 3
	{nDamageBase = 70 * 0.95, nDamageRand = 70 * 0.1, nCostMana = 409},		--level 4
	{nDamageBase = 84 * 0.95, nDamageRand = 84 * 0.1, nCostMana = 490},		--level 5
	{nDamageBase = 98 * 0.95, nDamageRand = 98 * 0.1, nCostMana = 572},		--level 6
	{nDamageBase = 112* 0.95, nDamageRand = 112* 0.1, nCostMana = 654},	--level 7
	{nDamageBase = 171 * 0.95, nDamageRand = 171 * 0.1, nCostMana = 731}, --level 8
	{nDamageBase = 228 * 0.95, nDamageRand = 228 * 0.1, nCostMana = 147},		--level 9
	{nDamageBase = 242 * 0.95, nDamageRand = 242 * 0.1, nCostMana = 220},		--level 10
	{nDamageBase = 256 * 0.95, nDamageRand = 256 * 0.1, nCostMana = 327},		--level 11
	{nDamageBase = 270 * 0.95, nDamageRand = 270 * 0.1, nCostMana = 409},		--level 12
	{nDamageBase = 284 * 0.95, nDamageRand = 284 * 0.1, nCostMana = 490},		--level 13
	{nDamageBase = 298 * 0.95, nDamageRand = 298 * 0.1, nCostMana = 572},		--level 14
	{nDamageBase = 312* 0.95, nDamageRand = 312* 0.1, nCostMana = 654},	--level 15
	{nDamageBase = 371 * 0.95, nDamageRand = 371 * 0.1, nCostMana = 731}, --level 16
	{nDamageBase = 428 * 0.95, nDamageRand = 428 * 0.1, nCostMana = 147},		--level 17
	{nDamageBase = 442 * 0.95, nDamageRand = 442 * 0.1, nCostMana = 220},		--level 18
	{nDamageBase = 456 * 0.95, nDamageRand = 456 * 0.1, nCostMana = 327},		--level 19
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

    local dwSkillLevel = skill.dwLevel;
    	
   	----------------- ħ������ -------------------------------------------------
 
   	skill.AddAttribute(													-- ���Ĺƴ���
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- ��������ģʽ
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- ħ������
 		3125,												--����ֵ1
 		dwSkillLevel										--����ֵ2
 		);

   	skill.AddAttribute(													-- �ݲйƴ���
 		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,						-- ��������ģʽ
 		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,								-- ħ������
 		3126,												--����ֵ1
 		dwSkillLevel										--����ֵ2
 		);
	----------------- ����ʩ��Buff���� ---------------------------------------------
	skill.AddSlowCheckSelfBuff(10130, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    --skill.AddSlowCheckSelfBuff(2315, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);	-- Ů洲��첻����
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
	--skill.BindBuff(1, 2509, dwSkillLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
	--skill.SetNormalCoolDown(1, 400);
	--skill.SetNormalCoolDown(1, 974);	--������ͨCD
    skill.SetCheckCoolDown(1, 444);
	skill.SetCheckCoolDown(2, 974);	--ֻ��鲻�ߵ�CD
   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
	--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
	--skill.nCostLife		= 0;									-- ������������ֵ
  	skill.nCostEnergy		= 20;							-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    --skill.nCostManaBasePercent = 0.5*(1+dwSkillLevel/8)*329;	-- �������ĵ�����
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 20 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 6 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
    --skill.nChannelInterval	= 24; 				-- ͨ�������ʱ�� 
    --skill.nChannelFrame		= 0;	 			-- ͨ��������ʱ�䣬��λ֡�� 
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
    --skill.nBeatBackRate       = 1 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
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
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(3835)
	end
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com