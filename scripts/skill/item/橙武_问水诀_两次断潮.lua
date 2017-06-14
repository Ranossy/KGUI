------------------------------------------------
-- �ļ���    :  ����_��Ѫս��_�������²�.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-05-08
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ��
-- ����Ч��  :  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nAddRage = 0, nCostRage = 20, nDamage = 14 * 0.95, nDamageRand = 14 * 0.1, nThreat = 259 * 2 }, -- Level 1 
	{nAddRage = 0, nCostRage = 20, nDamage = 23 * 0.95, nDamageRand = 23 * 0.1, nThreat = 389 * 2 }, -- Level 2 
	{nAddRage = 0, nCostRage = 20, nDamage = 31 * 0.95, nDamageRand = 31 * 0.1, nThreat = 518 * 2 }, -- Level 3 
	{nAddRage = 0, nCostRage = 20, nDamage = 39 * 0.95, nDamageRand = 39 * 0.1, nThreat = 648 * 2 }, -- Level 4 
	{nAddRage = 0, nCostRage = 20, nDamage = 47 * 0.95, nDamageRand = 47 * 0.1, nThreat = 778 * 2 }, -- Level 5 
	{nAddRage = 0, nCostRage = 20, nDamage = 54 * 0.95, nDamageRand = 54 * 0.1, nThreat = 907 * 2 }, -- Level 6 
	{nAddRage = 0, nCostRage = 20, nDamage = 62 * 0.95, nDamageRand = 62 * 0.1, nThreat = 1037 * 2 }, -- Level 7 
	{nAddRage = 0, nCostRage = 20, nDamage = 70 * 0.95, nDamageRand = 70 * 0.1, nThreat = 1166 * 2 }, -- Level 8 
	{nAddRage = 0, nCostRage = 20, nDamage = 78 * 0.95, nDamageRand = 78 * 0.1, nThreat = 1296 * 2 }, -- Level 9 
	{nAddRage = 0, nCostRage = 20, nDamage = 86 * 0.95, nDamageRand = 86 * 0.1, nThreat = 1426 * 2 }, -- Level 10
	{nAddRage = 0, nCostRage = 20, nDamage = 94 * 0.95, nDamageRand = 94 * 0.1, nThreat = 259 * 2 }, -- Level 11 
	{nAddRage = 0, nCostRage = 20, nDamage = 103 * 0.95, nDamageRand = 103 * 0.1, nThreat = 389 * 2 }, -- Level 12 
	{nAddRage = 0, nCostRage = 20, nDamage = 111 * 0.95, nDamageRand = 111 * 0.1, nThreat = 518 * 2 }, -- Level 13 
	{nAddRage = 0, nCostRage = 20, nDamage = 129 * 0.95, nDamageRand = 129 * 0.1, nThreat = 648 * 2 }, -- Level 14 
	{nAddRage = 0, nCostRage = 20, nDamage = 137 * 0.95, nDamageRand = 137 * 0.1, nThreat = 778 * 2 }, -- Level 15 
	{nAddRage = 0, nCostRage = 20, nDamage = 144 * 0.95, nDamageRand = 144 * 0.1, nThreat = 907 * 2 }, -- Level 16 
	{nAddRage = 0, nCostRage = 20, nDamage = 152 * 0.95, nDamageRand = 152 * 0.1, nThreat = 1037 * 2 }, -- Level 17 
	
};           
             

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local bRetCode     = false;
	local dwSkillLevel	= skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK, 
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage, 
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
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, 
		ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
		1722, 
		2
	);	
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	skill.AddSlowCheckSelfBuff(1722,	1,	BUFF_COMPARE_FLAG.EQUAL, 2, BUFF_COMPARE_FLAG.EQUAL);		-- ����Ŀ��Buff
    
	--skill.BindBuff(3, nBuffID, nBuffLevel);		-- ����3��λBuff
	--skill.BindBuff(4, nBuffID, nBuffLevel);		-- ����4��λBuff

    ----------------- ����Cool down --------------------------------------------
    --CoolDownIndexΪCDλ(��4��),nCoolDownIDΪCoolDownList.tab�ڵ�CDID
    --skill.SetNormalCoolDown(1, 361);						
    --skill.SetPublicCoolDown(16);	--����CD
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 0 * LENGTH_BASE;		-- �������ð뾶 
    --skill.nTargetCountLimit	= 2;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
 	skill.nChannelInterval	= 160;
	skill.nMinRadius	= 0* LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius        = 4 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange       = 128; 										--ʩ�ŽǶ�,ȫ��256
	--skill.nAreaRadius		= 6 * LENGTH_BASE;	
	skill.nWeaponDamagePercent	= 2048;
	skill.nPrepareFrames    = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity   = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate        = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	
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