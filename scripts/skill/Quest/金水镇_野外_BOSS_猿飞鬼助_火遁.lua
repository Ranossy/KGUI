------------------------------------------------
-- �ļ���    :  ��ˮ��_Ұ��_BOSS_Գ�ɹ���_���.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	���
-- ����Ч��  : 	��Ŀ�꼰����Χ�뾶10�׷�Χ��ɣ�4000�㣩�����ڹ��˺�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 3627 * 0.8, nDamageRand = 3627 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 4970 * 0.8, nDamageRand = 4970 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 8422 * 0.8, nDamageRand = 8422 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 12080 * 0.8, nDamageRand = 12080 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 17576 * 0.8, nDamageRand = 17576 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 23072 * 0.8, nDamageRand = 23072 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 31742 * 0.8, nDamageRand = 31742 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 37848 * 0.8, nDamageRand = 37848 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 43955 * 0.8, nDamageRand = 43955 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 50061 * 0.8, nDamageRand = 50061 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 56168 * 0.8, nDamageRand = 56168 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 62274 * 0.8, nDamageRand = 62274 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 68381 * 0.8, nDamageRand = 68381 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 74487 * 0.8, nDamageRand = 74487 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 80594 * 0.8, nDamageRand = 80594 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 89966 * 0.8, nDamageRand = 89966 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 92003 * 0.8, nDamageRand = 92003 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 94041 * 0.8, nDamageRand = 94041 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 96078 * 0.8, nDamageRand = 96078 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 642200 * 0.8 / 30, nDamageRand = 642200 * 0.4 / 30, nCostMana = 0},		--level 20
	{nDamageBase = 100152 * 0.8, nDamageRand = 100152 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 102189 * 0.8, nDamageRand = 102189 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 104227 * 0.8, nDamageRand = 104227 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 106264 * 0.8, nDamageRand = 106264 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 108301 * 0.8, nDamageRand = 108301 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 110338 * 0.8, nDamageRand = 110338 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 112375 * 0.8, nDamageRand = 112375 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 114413 * 0.8, nDamageRand = 114413 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 116450 * 0.8, nDamageRand = 116450 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 100000 * 0.8, nDamageRand = 100000 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 120524 * 0.8, nDamageRand = 120524 * 0.4, nCostMana = 0},		--level 31
};                 

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		  ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		  0											
   		);
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);	
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
			0, 
			0
			);	

    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,1331,1);		-- ����1��λBuff �����������HOT
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 4 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 32;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    skill.nPrepareFrames  	= 32;				-- ����֡��
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
    skill.nBrokenRate         = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
    --skill.nBreakRate			= 0 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024	
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