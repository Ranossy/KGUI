------------------------------------------------
-- �ļ���    :  ��ˮ��_Ұ��_BOSS_Գ�ɹ���_һ��ն.lua
-- ������    :  �	
-- ����ʱ��  :  2009-7-27
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  ��
-- �书��·  :  ��
-- ��������  : 	һ��ն
-- ����Ч��  : 	����ǰ���ͷŰ뾶20�����η�Χ��60�ȣ���������ڹ��˺���6000�㣩
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamageBase = 270     *0.8, nDamageRand = 270      *0.4, nCostMana = 0},		--level 1
	{nDamageBase = 370     *0.8, nDamageRand = 370      *0.4, nCostMana = 0},		--level 2
	{nDamageBase = 627     *0.8, nDamageRand = 627      *0.4, nCostMana = 0},		--level 3
	{nDamageBase = 899     *0.8, nDamageRand = 899      *0.4, nCostMana = 0},		--level 4
	{nDamageBase = 1308    *0.8, nDamageRand = 1308     *0.4, nCostMana = 0},		--level 5
	{nDamageBase = 1717    *0.8, nDamageRand = 1717     *0.4, nCostMana = 0},		--level 6
	{nDamageBase = 2363    *0.8, nDamageRand = 2363     *0.4, nCostMana = 0},		--level 7
	{nDamageBase = 2817    *0.8, nDamageRand = 2817     *0.4, nCostMana = 0},		--level 8
	{nDamageBase = 3272    *0.8, nDamageRand = 3272     *0.4, nCostMana = 0},		--level 9
	{nDamageBase = 3727    *0.8, nDamageRand = 3727     *0.4, nCostMana = 0},		--level 10
	{nDamageBase = 4181    *0.8, nDamageRand = 4181     *0.4, nCostMana = 0},		--level 11
	{nDamageBase = 4636    *0.8, nDamageRand = 4636     *0.4, nCostMana = 0},		--level 12
	{nDamageBase = 5090    *0.8, nDamageRand = 5090     *0.4, nCostMana = 0},		--level 13
	{nDamageBase = 5545    *0.8, nDamageRand = 5545     *0.4, nCostMana = 0},		--level 14
	{nDamageBase = 23900    *0.8, nDamageRand = 23900     *0.4, nCostMana = 0},		--level 15
	{nDamageBase = 6697    *0.8, nDamageRand = 6697     *0.4, nCostMana = 0},		--level 16
	{nDamageBase = 6849    *0.8, nDamageRand = 6849     *0.4, nCostMana = 0},		--level 17
	{nDamageBase = 7001    *0.8, nDamageRand = 7001     *0.4, nCostMana = 0},		--level 18
	{nDamageBase = 7152    *0.8, nDamageRand = 7152     *0.4, nCostMana = 0},		--level 19
	{nDamageBase = 47800    *0.8, nDamageRand = 47800     *0.4, nCostMana = 0},		--level 20
	{nDamageBase = 7455    *0.8, nDamageRand = 7455     *0.4, nCostMana = 0},		--level 21
	{nDamageBase = 7607    *0.8, nDamageRand = 7607     *0.4, nCostMana = 0},		--level 22
	{nDamageBase = 7759    *0.8, nDamageRand = 7759     *0.4, nCostMana = 0},		--level 23
	{nDamageBase = 7910    *0.8, nDamageRand = 7910     *0.4, nCostMana = 0},		--level 24
	{nDamageBase = 8062    *0.8, nDamageRand = 8062     *0.4, nCostMana = 0},		--level 25
	{nDamageBase = 8214    *0.8, nDamageRand = 8214     *0.4, nCostMana = 0},		--level 26
	{nDamageBase = 8365    *0.8, nDamageRand = 8365     *0.4, nCostMana = 0},		--level 27
	{nDamageBase = 8517    *0.8, nDamageRand = 8517     *0.4, nCostMana = 0},		--level 28
	{nDamageBase = 8669    *0.8, nDamageRand = 8669     *0.4, nCostMana = 0},		--level 29
	{nDamageBase = 8820    *0.8, nDamageRand = 8820     *0.4, nCostMana = 0},		--level 30
};               

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;


   	----------------- ħ������ -------------------------------------------------

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

   	skill.AddAttribute(
   		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,			-- ��������ģʽ
   		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,								-- ħ������
   		"skill/Quest/��ˮ��_Ұ��_BOSS_Գ�ɹ���_һ��ն.lua",				-- ����ֵ1
   		0														-- ����ֵ2
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
	skill.nMaxRadius		= 19 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	skill.nAngleRange		= 114;					-- ������Χ�����νǶȷ�Χ 
	skill.nAreaRadius		= 19 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit	= 32;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
    
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
         if not IsPlayer(dwCharacterID) then
                   return
         end
         local player = GetPlayer(dwCharacterID)
         if player then
                   local scene = player.GetScene()
                   local Parry = player.nParry
                   local ParryBase = player.nParryBaseRate
                   local ParryRate = ParryBase/100 + 100 * Parry /(Parry + 2150)
                   local npc = scene.GetNpcByNickName("yuanfeiguizhu")                   
                   if npc then
                            if ParryRate < 30 and ParryRate >= 27.5 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(7305, 1)                                  
                            end
                            if ParryRate < 27.5 and ParryRate >= 25 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(7305, 2)                                  
                            end
                            if ParryRate < 25 then
                                     npc.SetTarget(TARGET.PLAYER,player.dwID);
                                     npc.CastSkill(7305, 3)                                  
                            end
                   end
         end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com