------------------------------------------------
-- �ļ���    :  ݶ����_BOSS3_��ɳ����.lua
-- ������    :  CBG
-- ����ʱ��  :  2009-9-24
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  �����������������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 214  *0.95, nDamageRand = 214  *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 1 },		--level 1
	{nDamageBase = 363  *0.95, nDamageRand = 363  *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 2 },		--level 2
	{nDamageBase = 521  *0.95, nDamageRand = 521  *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 3 },		--level 3
	{nDamageBase = 758  *0.95, nDamageRand = 758  *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 4 },		--level 4
	{nDamageBase = 995  *0.95, nDamageRand = 995  *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 5 },		--level 5
	{nDamageBase = 1369 *0.95, nDamageRand = 1369 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 6 },		--level 6
	{nDamageBase = 1632 *0.95, nDamageRand = 1632 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 7 },		--level 7
	{nDamageBase = 1895 *0.95, nDamageRand = 1895 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 8 },		--level 8
	{nDamageBase = 2159 *0.95, nDamageRand = 2159 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 9 },		--level 9
	{nDamageBase = 2422 *0.95, nDamageRand = 2422 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 10},		--level 10
	{nDamageBase = 2685 *0.95, nDamageRand = 2685 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 11},		--level 11
	{nDamageBase = 2949 *0.95, nDamageRand = 2949 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 12},		--level 12
	{nDamageBase = 3212 *0.95, nDamageRand = 3212 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 13},		--level 13
	{nDamageBase = 3475 *0.95, nDamageRand = 3475 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 14},		--level 14
	{nDamageBase = 3738 *0.95, nDamageRand = 3738 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 15},		--level 15
	{nDamageBase = 4002 *0.95, nDamageRand = 4002 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 16 },		--level 16
	{nDamageBase = 4265 *0.95, nDamageRand = 4265 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 17 },		--level 17
	{nDamageBase = 4528 *0.95, nDamageRand = 4528 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 18 },		--level 18
	{nDamageBase = 4792 *0.95, nDamageRand = 4792 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 19 },		--level 19
	{nDamageBase = 5055 *0.95, nDamageRand = 5055 *0.1, nCostMana = 0, nBuffID=0, nBuffLevel= 20},		--level 20
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
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
    --skill.BindBuff(1,tSkillData[dwSkillLevel].nBuffID,tSkillData[dwSkillLevel].nBuffLevel);		-- ����1��λBuff
	--skill.BindBuff(2, nBuffID, nBuffLevel);		-- ����2��λBuff
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetCoolDown(1, 16);						-- ����CD 1.5��
    --skill.SetCoolDown(CoolDownIndex, nCoolDownID);

   	----------------- ����������� ---------------------------------------------
   	--ע��,��Ȼ��Щ���ݿ����ڽű��ڸ���,��һ�㲻���κθĶ�!
    --skill.dwLevelUpExp	= 0;    				-- ��������
    --skill.nExpAddOdds		= 1024;					-- ������������������
	--skill.nPlayerLevelLimit	= 0;				-- ��ɫ����ѧ��ü���������ﵽ����͵ȼ�

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
	skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 30 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 0;				-- ����֡��
    --skill.nChannelInterval	= 0; 				-- ͨ�������ʱ�� 
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
    --skill.nSelfLifePercentMin	= 0;			-- Ѫ����Сֵ>=
    --skill.nSelfLifePercentMax	= 100;			-- Ѫ�����ֵ<=
    
    ----------------- ������ -------------------------------------------------
    --skill.nBrokenRate         = 0.3 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
	----------------- �����˺���� ---------------------------------------------
	--skill.nWeaponDamagePercent		= 0;			-- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
	
    return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
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