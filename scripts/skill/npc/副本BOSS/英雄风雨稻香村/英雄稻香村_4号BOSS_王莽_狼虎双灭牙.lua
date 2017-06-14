------------------------------------------------
-- �ļ���    :  Ӣ�۵����_4��BOSS_��ç_�ǻ�˫����.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-11-20
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �ǻ�˫����
-- ����Ч��  :  �ܺõ�Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 180 * 0.8, nDamageRand = 180 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 247 * 0.8, nDamageRand = 247 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 418 * 0.8, nDamageRand = 418 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 600 * 0.8, nDamageRand = 600 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 872 * 0.8, nDamageRand = 872 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1145 * 0.8, nDamageRand = 1145 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 1575 * 0.8, nDamageRand = 1575 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 1878 * 0.8, nDamageRand = 1878 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 2182 * 0.8, nDamageRand = 2182 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 2485 * 0.8, nDamageRand = 2485 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 2788 * 0.8, nDamageRand = 2788 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 3091 * 0.8, nDamageRand = 3091 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 3394 * 0.8, nDamageRand = 3394 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 3697 * 0.8, nDamageRand = 3697 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 4000 * 0.8, nDamageRand = 4000 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 4465 * 0.8, nDamageRand = 4465 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 4566 * 0.8, nDamageRand = 4566 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 4667 * 0.8, nDamageRand = 4667 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 4768 * 0.8, nDamageRand = 4768 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 4870 * 0.8, nDamageRand = 4870 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 4971 * 0.8, nDamageRand = 4971 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 5072 * 0.8, nDamageRand = 5072 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 5173 * 0.8, nDamageRand = 5173 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 5274 * 0.8, nDamageRand = 5274 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 5375 * 0.8, nDamageRand = 5375 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 5476 * 0.8, nDamageRand = 5476 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 5577 * 0.8, nDamageRand = 5577 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 5678 * 0.8, nDamageRand = 5678 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 5780 * 0.8, nDamageRand = 5780 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 5881 * 0.8, nDamageRand = 5881 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 5982 * 0.8, nDamageRand = 5982 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
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

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		skill.BindBuff(1, 1560, 1);		-- ����1��λBuff
		--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
		--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
		--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    -- ����CD
    --skill.SetPublicCoolDown(16);							-- ����CD 1.5��
    -- ����CD, CoolDownIndexΪCDλ(��3��), nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(CoolDownIndex, nCoolDownID);	

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
		--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

	----------------- ���ܳ�� -------------------------------------------------
		--skill.nBaseThreat		= 0;

	----------------- �������� -------------------------------------------------
		--skill.nCostLife		= 0;									-- ������������ֵ
    --skill.nCostMana      	= tSkillData[dwSkillLevel].nCostMana;	-- �������ĵ�����
    --skill.nCostStamina	= 0;									-- �������ĵ�����
    --skill.nCostItemType	= 0;									-- �������ĵ���Ʒ����
    --skill.nCostItemIndex	= 0;									-- �������ĵ���Ʒ����ID
    
    ----------------- ������� -------------------------------------------------
    --skill.bIsAccumulate	= false;				-- �����Ƿ���Ҫ����
    --skill.SetSubsectionSkill(nBeginInterval, nEndInterval, dwSkillID, dwSkillLevel)
    
    ----------------- ��״������� ---------------------------------------------
    --skill.nChainBranch	= 1;					--��״���ܷ�֧��
    --skill.nChainDepth		= 3;					--��״���ܲ���
    --��״���ܵ��Ӽ�����skill.SetSubsectionSkill()�趨
    
    
    ----------------- ʩ�ž��� -------------------------------------------------
		--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
		skill.nMaxRadius		= 5 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
		skill.nAngleRange		= 128;					-- ������Χ�����νǶȷ�Χ 
		skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
		skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
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
	
end

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com