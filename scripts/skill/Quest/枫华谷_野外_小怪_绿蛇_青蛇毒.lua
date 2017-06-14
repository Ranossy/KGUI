------------------------------------------------
-- �ļ���    :  �㻪��_Ұ��_С��_����_���߶�.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	���߶�
-- ����Ч��  : 	��ɢ��Ы�Ʋ���ɶ���ֱ���˺���1500�㣩
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 67      *0.8, nDamageRand = 67       *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 92      *0.8, nDamageRand = 92       *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 157     *0.8, nDamageRand = 157      *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 225     *0.8, nDamageRand = 225      *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 327     *0.8, nDamageRand = 327      *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 429     *0.8, nDamageRand = 429      *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 591     *0.8, nDamageRand = 591      *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 704     *0.8, nDamageRand = 704      *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 818     *0.8, nDamageRand = 818      *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 932     *0.8, nDamageRand = 932      *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 1045    *0.8, nDamageRand = 1045     *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 1159    *0.8, nDamageRand = 1159     *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 1273    *0.8, nDamageRand = 1273     *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 1386    *0.8, nDamageRand = 1386     *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 1500    *0.8, nDamageRand = 1500     *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 1674    *0.8, nDamageRand = 1674     *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 1712    *0.8, nDamageRand = 1712     *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 1750    *0.8, nDamageRand = 1750     *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 1788    *0.8, nDamageRand = 1788     *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 1826    *0.8, nDamageRand = 1826     *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 1864    *0.8, nDamageRand = 1864     *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 1902    *0.8, nDamageRand = 1902     *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 1940    *0.8, nDamageRand = 1940     *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 1978    *0.8, nDamageRand = 1978     *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 2016    *0.8, nDamageRand = 2016     *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 2053    *0.8, nDamageRand = 2053     *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 2091    *0.8, nDamageRand = 2091     *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 2129    *0.8, nDamageRand = 2129     *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 2167    *0.8, nDamageRand = 2167     *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 2205    *0.8, nDamageRand = 2205     *0.4, nCostMana = 0},		--level 30
};               

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		  ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE,
		  tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		  0											
   		);
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
			ATTRIBUTE_TYPE.SKILL_POISON_DAMAGE_RAND,
			tSkillData[dwSkillLevel].nDamageRand * 0.14, 
			0
			);	
   		
   	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.CALL_POISON_DAMAGE,
			0, 
			0
			);	
			
	skill.AddAttribute(
			ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
			ATTRIBUTE_TYPE.DEL_SINGLE_BUFF_BY_ID_AND_LEVEL,
			1340,
			1
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
	skill.nMaxRadius		= 25 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 25 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 32;				-- ����֡��
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