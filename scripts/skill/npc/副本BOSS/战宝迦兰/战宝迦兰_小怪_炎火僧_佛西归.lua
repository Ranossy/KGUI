------------------------------------------------
-- �ļ���    :  ս������_С��_�׻�ɮ_������.lua
-- ������    :  �	
-- ����ʱ��  :  2009-6-26
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  ������
-- ����Ч��  :  �Ա������8�߷�Χ�����9000�������ڹ��˺�----------------                                               
                                            
--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 405     *0.8, nDamageRand = 405     *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 555     *0.8, nDamageRand = 555     *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 940     *0.8, nDamageRand = 940     *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1349    *0.8, nDamageRand = 1349    *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1963    *0.8, nDamageRand = 1963    *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 2576    *0.8, nDamageRand = 2576    *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 3545    *0.8, nDamageRand = 3545    *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 4227    *0.8, nDamageRand = 4227    *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 4908    *0.8, nDamageRand = 4908    *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 5590    *0.8, nDamageRand = 5590    *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 6272    *0.8, nDamageRand = 6272    *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 6954    *0.8, nDamageRand = 6954    *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 7636    *0.8, nDamageRand = 7636    *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 8318    *0.8, nDamageRand = 8318    *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 9000    *0.8, nDamageRand = 9000    *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 10047   *0.8, nDamageRand = 10047   *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 10274   *0.8, nDamageRand = 10274   *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 10502   *0.8, nDamageRand = 10502   *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 10729   *0.8, nDamageRand = 10729   *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 10957   *0.8, nDamageRand = 10957   *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 11184   *0.8, nDamageRand = 11184   *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 11412   *0.8, nDamageRand = 11412   *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 11639   *0.8, nDamageRand = 11639   *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 11867   *0.8, nDamageRand = 11867   *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 12094   *0.8, nDamageRand = 12094   *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 12322   *0.8, nDamageRand = 12322   *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 12549   *0.8, nDamageRand = 12549   *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 12777   *0.8, nDamageRand = 12777   *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 13004   *0.8, nDamageRand = 13004   *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 13232   *0.8, nDamageRand = 13232   *0.4, nCostMana = 0},		--level 30
};                

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	local bRetCode     = false;
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
   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,							-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,																	-- ħ������
   		"skill/npc/����BOSS/ս������/ս������_С��_�׻�ɮ_������.lua",	-- ����ֵ1
   		0																																-- ����ֵ2
   	);
    
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
  --skill.BindBuff(1,1230,1);		-- ����1��λBuff
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
	skill.nAreaRadius		= 8 * LENGTH_BASE;		-- �������ð뾶 
	--skill.nTargetCountLimit	= 5				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
		local npc
		npc = GetNpc(dwCharacterID)
		if npc then
		npc.Die()
		end

end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com