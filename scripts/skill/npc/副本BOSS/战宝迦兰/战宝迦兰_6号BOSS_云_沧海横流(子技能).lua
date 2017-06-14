------------------------------------------------
-- �ļ���    : 	ս������_6��BOSS_��_�׺�����(�Ӽ���).lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-8
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  �׺�����(�Ӽ���)
-- ����Ч��  :  ÿ15��һ�Σ��Ե�ǰĿ�귽��ʩ��һ��׶״�����ڹ��˺����ܣ��Ƕ�180����ɢ����30�ߣ��˺�2000��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 90   *0.8, nDamageRand = 90     *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 123  *0.8, nDamageRand = 123    *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 209  *0.8, nDamageRand = 209    *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 300  *0.8, nDamageRand = 300    *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 436  *0.8, nDamageRand = 436    *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 572  *0.8, nDamageRand = 572    *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 788  *0.8, nDamageRand = 788    *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 939  *0.8, nDamageRand = 939    *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 1091 *0.8, nDamageRand = 1091   *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 1242 *0.8, nDamageRand = 1242   *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 1394 *0.8, nDamageRand = 1394   *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 1545 *0.8, nDamageRand = 1545   *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 1697 *0.8, nDamageRand = 1697   *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 1848 *0.8, nDamageRand = 1848   *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 2000 *0.8, nDamageRand = 2000   *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 6028 * 0.8, nDamageRand = 6028 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 6164 * 0.8, nDamageRand = 6164 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 6301 * 0.8, nDamageRand = 6301 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 6437 * 0.8, nDamageRand = 6437 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 6574 * 0.8, nDamageRand = 6574 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 6710 * 0.8, nDamageRand = 6710 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 6847 * 0.8, nDamageRand = 6847 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 6983 * 0.8, nDamageRand = 6983 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 7120 * 0.8, nDamageRand = 7120 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 7256 * 0.8, nDamageRand = 7256 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 7393 * 0.8, nDamageRand = 7393 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 7529 * 0.8, nDamageRand = 7529 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 7666 * 0.8, nDamageRand = 7666 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 7802 * 0.8, nDamageRand = 7802 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 7939 * 0.8, nDamageRand = 7939 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 8075 * 0.8, nDamageRand = 8075 * 0.4, nCostMana = 0},		--level 31
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase * 0.14, 
		0
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_LUNAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand * 0.14, 
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_LUNAR_DAMAGE,
		0, 
		0
	);
   	----------------- ħ������ -------------------------------------------------

--   	skill.AddAttribute(
--   		ATTRIBUTE_EFFECT_MODE.nAttributeEffectMode,					-- ��������ģʽ
--   		ATTRIBUTE_TYPE.nAttributeKey,								-- ħ������
--   		nAttributeValue1,											-- ����ֵ1
--   		nAttributeValue2											-- ����ֵ2
--   		);

    
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
	--skill.nMinRadius		= 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius		= 63 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 84;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 63 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 20;			-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 24;				-- ����֡��
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
    skill.nBrokenRate     = 0 * PERCENT_BASE;	  -- ���ܱ���ϵĸ���.����1024
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