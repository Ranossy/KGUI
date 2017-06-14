------------------------------------------------
-- �ļ���    :  ս������_�����_��ͨ����.lua
-- ������    :  CBG
-- ����ʱ��  :  2010-01-28
-- ��;(ģ��):  ����BOSS
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  :  
-- ����Ч��  :  ��������~��ѹ������
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 573 * 0.8, nDamageRand = 573 * 0.4, nCostMana = 0},		--level 1
	{nDamageBase = 785 * 0.8, nDamageRand = 785 * 0.4, nCostMana = 0},		--level 2
	{nDamageBase = 1331 * 0.8, nDamageRand = 1331 * 0.4, nCostMana = 0},		--level 3
	{nDamageBase = 1909 * 0.8, nDamageRand = 1909 * 0.4, nCostMana = 0},		--level 4
	{nDamageBase = 2777 * 0.8, nDamageRand = 2777 * 0.4, nCostMana = 0},		--level 5
	{nDamageBase = 3646 * 0.8, nDamageRand = 3646 * 0.4, nCostMana = 0},		--level 6
	{nDamageBase = 5015 * 0.8, nDamageRand = 5015 * 0.4, nCostMana = 0},		--level 7
	{nDamageBase = 5980 * 0.8, nDamageRand = 5980 * 0.4, nCostMana = 0},		--level 8
	{nDamageBase = 6945 * 0.8, nDamageRand = 6945 * 0.4, nCostMana = 0},		--level 9
	{nDamageBase = 7910 * 0.8, nDamageRand = 7910 * 0.4, nCostMana = 0},		--level 10
	{nDamageBase = 8875 * 0.8, nDamageRand = 8875 * 0.4, nCostMana = 0},		--level 11
	{nDamageBase = 9840 * 0.8, nDamageRand = 9840 * 0.4, nCostMana = 0},		--level 12
	{nDamageBase = 10805 * 0.8, nDamageRand = 10805 * 0.4, nCostMana = 0},		--level 13
	{nDamageBase = 11770 * 0.8, nDamageRand = 11770 * 0.4, nCostMana = 0},		--level 14
	{nDamageBase = 12734 * 0.8, nDamageRand = 12734 * 0.4, nCostMana = 0},		--level 15
	{nDamageBase = 14215 * 0.8, nDamageRand = 14215 * 0.4, nCostMana = 0},		--level 16
	{nDamageBase = 14537 * 0.8, nDamageRand = 14537 * 0.4, nCostMana = 0},		--level 17
	{nDamageBase = 14859 * 0.8, nDamageRand = 14859 * 0.4, nCostMana = 0},		--level 18
	{nDamageBase = 15181 * 0.8, nDamageRand = 15181 * 0.4, nCostMana = 0},		--level 19
	{nDamageBase = 15503 * 0.8, nDamageRand = 15503 * 0.4, nCostMana = 0},		--level 20
	{nDamageBase = 15825 * 0.8, nDamageRand = 15825 * 0.4, nCostMana = 0},		--level 21
	{nDamageBase = 16147 * 0.8, nDamageRand = 16147 * 0.4, nCostMana = 0},		--level 22
	{nDamageBase = 16469 * 0.8, nDamageRand = 16469 * 0.4, nCostMana = 0},		--level 23
	{nDamageBase = 16791 * 0.8, nDamageRand = 16791 * 0.4, nCostMana = 0},		--level 24
	{nDamageBase = 17112 * 0.8, nDamageRand = 17112 * 0.4, nCostMana = 0},		--level 25
	{nDamageBase = 17434 * 0.8, nDamageRand = 17434 * 0.4, nCostMana = 0},		--level 26
	{nDamageBase = 17756 * 0.8, nDamageRand = 17756 * 0.4, nCostMana = 0},		--level 27
	{nDamageBase = 18078 * 0.8, nDamageRand = 18078 * 0.4, nCostMana = 0},		--level 28
	{nDamageBase = 18400 * 0.8, nDamageRand = 18400 * 0.4, nCostMana = 0},		--level 29
	{nDamageBase = 12500 * 0.8, nDamageRand = 12500 * 0.4, nCostMana = 0},		--level 30
	{nDamageBase = 19044 * 0.8, nDamageRand = 19044 * 0.4, nCostMana = 0},		--level 31
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


   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/npc/����BOSS/25��ս������/ս������_�����_��ͨ����.lua",				-- ����ֵ1
   		0														-- ����ֵ2
   		);

    --skill.AddSlowCheckSelfBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ��������Buff
	----------------- ����ʩ��Buff���� ---------------------------------------------
    --skill.AddSlowCheckDestBuff(dwBuffID, nStackNum, eCompareFlag, nLevel, eLevelCompareFlag);		-- ����Ŀ��Buff
    
	----------------- BUFF��� -------------------------------------------------
		--skill.BindBuff(1, 994, 5);		-- ����1��λBuff
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
		--skill.nAreaRadius		= 40 * LENGTH_BASE;		-- �������ð뾶 
		--skill.nTargetCountLimit	= 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
    ----------------- ʱ����� -------------------------------------------------
    --skill.nPrepareFrames  	= 48;				-- ����֡��
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
    --skill.nBeatBackRate       = 0 * PERCENT_BASE;		-- ���ܱ����˵ĸ���,Ĭ��1024
    --skill.nBrokenRate         = 0 * PERCENT_BASE;		-- ���ܱ���ϵĸ���,Ĭ��1024
    --skill.nBreakRate		= 1024 * PERCENT_BASE;		-- ���Ŀ��ʩ���ĸ���,����1024
	
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
         if not IsPlayer(dwCharacterID) then
                   return
         end
         local player = GetPlayer(dwCharacterID)
         if player then
                   local scene = player.GetScene()
                   local Parry = player.nParry
                   local ParryBase = player.nParryBaseRate
                   local ParryRate = ParryBase/100 + 100 * Parry /(Parry + 2150)
                   local npc = scene.GetNpcByNickName("boss5")                   
                   if npc then
                            if ParryRate < 30 and ParryRate >= 20 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(1575, 3)                                  
                            end
                            if ParryRate < 20 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(1575, 1)                                  
                            end
                   end
         end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com