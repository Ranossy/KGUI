------------------------------------------------
-- �ļ���    :  ս������_1��BOSS_����_�ݳ�ǹ�����.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-20
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �ݳ�ǹ�����
-- ����Ч��  : 	�⹦�˺�18000������2�룬���Ա���ϣ���Ŀ������⹦�˺���,���˰�������3�룬���Ա���ϡ���������ԭ����0.5�룬�����ǲ����ܱ���ϵġ���
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 810     *0.8, nDamageRand = 810    *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 1110    *0.8, nDamageRand = 1110   *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 1881    *0.8, nDamageRand = 1881   *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 2698    *0.8, nDamageRand = 2698   *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 3925    *0.8, nDamageRand = 3925   *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 5153    *0.8, nDamageRand = 5153   *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 7089    *0.8, nDamageRand = 7089   *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 8453    *0.8, nDamageRand = 8453   *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 9817    *0.8, nDamageRand = 9817   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 11181   *0.8, nDamageRand = 11181  *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 12545   *0.8, nDamageRand = 12545  *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 13908   *0.8, nDamageRand = 13908  *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 15272   *0.8, nDamageRand = 15272  *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 16636   *0.8, nDamageRand = 16636  *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 18000   *0.8, nDamageRand = 18000  *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 20093   *0.8, nDamageRand = 20093  *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 20548   *0.8, nDamageRand = 20548  *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 21003   *0.8, nDamageRand = 21003  *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 21458   *0.8, nDamageRand = 21458  *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 21913   *0.8, nDamageRand = 21913  *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 22368   *0.8, nDamageRand = 22368  *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 22823   *0.8, nDamageRand = 22823  *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 23278   *0.8, nDamageRand = 23278  *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 23733   *0.8, nDamageRand = 23733  *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 24188   *0.8, nDamageRand = 24188  *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 24643   *0.8, nDamageRand = 24643  *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 25098   *0.8, nDamageRand = 25098  *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 25553   *0.8, nDamageRand = 25553  *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 26008   *0.8, nDamageRand = 26008  *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 90000   *0.8, nDamageRand = 90000  *0.4, nCostMana = 0},		--level 30
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
  --skill.BindBuff(1,1332,1);		-- ����1��λBuff �����������HOT
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
	skill.nMaxRadius		= 8 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 256;					-- ������Χ�����νǶȷ�Χ 
	--skill.nAreaRadius		= 5 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 20;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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