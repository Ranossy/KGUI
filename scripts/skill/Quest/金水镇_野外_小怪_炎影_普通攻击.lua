------------------------------------------------
-- �ļ���    :  ��ˮ��_Ұ��_С��_��Ӱ_��ͨ����.lua
-- ������    :  �	
-- ����ʱ��  :  2009-8-10
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	��ͨ����
-- ����Ч��  : 	�Ե�ǰĿ���ͷ���ͨ��������������˺�����ֵͬ��ͨ������7200��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 324   *0.8, nDamageRand = 324    *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 444   *0.8, nDamageRand = 444    *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 752   *0.8, nDamageRand = 752    *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1079  *0.8, nDamageRand = 1079   *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1570  *0.8, nDamageRand = 1570   *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2061  *0.8, nDamageRand = 2061   *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2836  *0.8, nDamageRand = 2836   *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 3381  *0.8, nDamageRand = 3381   *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3927  *0.8, nDamageRand = 3927   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 19200  *0.8, nDamageRand =19200   *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 5018  *0.8, nDamageRand = 5018   *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 5563  *0.8, nDamageRand = 5563   *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 6109  *0.8, nDamageRand = 6109   *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 6654  *0.8, nDamageRand = 6654   *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 7200  *0.8, nDamageRand = 7200   *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 8037  *0.8, nDamageRand = 8037   *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 8219  *0.8, nDamageRand = 8219   *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 8401  *0.8, nDamageRand = 8401   *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 8583  *0.8, nDamageRand = 8583   *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 8765  *0.8, nDamageRand = 8765   *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 8947  *0.8, nDamageRand = 8947   *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 9129  *0.8, nDamageRand = 9129   *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 9311  *0.8, nDamageRand = 9311   *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 9493  *0.8, nDamageRand = 9493   *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 9675  *0.8, nDamageRand = 9675   *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 9857  *0.8, nDamageRand = 9857   *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 10039 *0.8, nDamageRand = 10039  *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 10221 *0.8, nDamageRand = 10221  *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 10403 *0.8, nDamageRand = 10403  *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 10585 *0.8, nDamageRand = 10585  *0.4, nCostMana = 0},		--level 30
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
  	--skill.BindBuff(1,1365,1);		-- ����1��λBuff �����������HOT
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
	--skill.nAreaRadius		= 10 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 48;				-- ����֡��
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